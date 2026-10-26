#include "SneakySnake.h"

#include <chrono>
#include <fstream>
#include <iostream>
#include <limits>
#include <sstream>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>
#include <omp.h>

namespace {
int number(const char* value, int minimum) {
    std::size_t end = 0;
    const long long result = std::stoll(value, &end);
    if (value[end] != '\0' || result < minimum || result > std::numeric_limits<int>::max()) {
        throw std::runtime_error("Invalid numeric argument");
    }
    return static_cast<int>(result);
}
}

int main(int argc, char** argv) {
    if (argc < 3 || argc > 4) {
        std::cerr << "Usage: sneaky_snake <dataset> <edit-threshold> [threads]\n";
        return 1;
    }
    try {
        const int threshold = number(argv[2], 0);
        const int threads = argc == 4 ? number(argv[3], 1) : 1;
        std::ifstream input(argv[1]);
        if (!input) throw std::runtime_error("Cannot open dataset");

        // Parse once before parallel processing: streams must not be shared by workers.
        std::vector<std::pair<std::string, std::string>> reads;
        std::string line;
        std::size_t line_number = 0;
        while (std::getline(input, line)) {
            ++line_number;
            std::istringstream row(line);
            std::string query, reference, extra;
            if (!(row >> query >> reference) || (row >> extra) ||
                query.size() != reference.size() ||
                query.size() > static_cast<std::size_t>(std::numeric_limits<int>::max()) ||
                query.find_first_not_of("ACGTN") != std::string::npos ||
                reference.find_first_not_of("ACGTN") != std::string::npos) {
                throw std::runtime_error("Invalid sequence pair at line " + std::to_string(line_number));
            }
            reads.emplace_back(std::move(query), std::move(reference));
        }
        if (input.bad()) throw std::runtime_error("Error reading dataset");
        if (reads.empty()) throw std::runtime_error("Dataset is empty");

        long long accepted = 0, rejected = 0;
        const auto start = std::chrono::steady_clock::now();
        const auto count = static_cast<long long>(reads.size());
#pragma omp parallel for num_threads(threads) schedule(static) reduction(+:accepted,rejected)
        for (long long i = 0; i < count; ++i) {
            auto& pair = reads[static_cast<std::size_t>(i)];
            const int result = SneakySnake(static_cast<int>(pair.first.size()),
                pair.second.data(), pair.first.data(), threshold, 0, 0, 0);
            if (result == 1) ++accepted;
            else ++rejected;
        }
        const double ms = std::chrono::duration<double, std::milli>(
            std::chrono::steady_clock::now() - start).count();
        std::cout << "Total Reads: " << count << "\nRequested Threads: " << threads
                  << "\nTotal Accepted Reads: " << accepted
                  << "\nTotal Rejected Reads: " << rejected
                  << "\nFiltering Time (ms): " << ms << '\n';
    } catch (const std::exception& error) {
        std::cerr << "Error: " << error.what() << '\n';
        return 1;
    }
}
