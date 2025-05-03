#pragma once

#include <concepts>
#include <iterator>

#include "book.hpp"

namespace bookdb {

template <typename T>
concept BookContainerLike = ;

template <typename T>
concept BookIterator = ;

template <typename S, typename I>
concept BookSentinel = ;

template <typename P>
concept BookPredicate = ;

template <typename C>
concept BookComparator = ;

}  // namespace bookdb