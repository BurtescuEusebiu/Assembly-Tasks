# Algorithms & Assembly Tasks

**Bracket Validator, Sorting & Searching, Graph Traversal, x64 Map/Reduce | C / C++ / x64 Assembly**

- **Task 1 – Bracket Validator**  
  - Implemented a program to check if parentheses, brackets, and braces are correctly balanced  
  - Used three separate counters for `()`, `[]`, `{}` to increment/decrement on open/close  
  - Input is invalid if any counter becomes negative or is non-zero at the end

- **Task 2 – Sorting & Searching**  
  - **Quick Sort:** Standard algorithm with last element as pivot, recursively sorting left and right partitions  
  - **Binary Search:** Standard algorithm, recursively searching left or right half until element is found or search completes, returning index or -1

- **Task 3 – Depth-First Search (DFS)**  
  - Implemented standard DFS on graphs using a visited array  
  - Nodes are marked visited upon first exploration and all unvisited neighbors are recursively visited  
  - Printed nodes in the order they are first visited

- **Bonus – Map & Reduce in x64 Assembly**  
  - Created `MAP` and `REDUCE` functions using x64 calling conventions  
  - Manipulated registers for destination and accumulator to call user-defined functions  
