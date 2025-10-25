#  Queue

## Introduction

A **queue** is a **linear data structure** that follows the **FIFO (First In, First Out)** principle.
    

### Example:

`Front → [A, B, C, D] ← Rear  Enqueue(E): add at the rear → [A, B, C, D, E] Dequeue(): remove from front → returns A → [B, C, D, E]`

---

## Basic Operations

|Operation|Description|Time Complexity|
|---|---|---|
|`enqueue(x)`|Add element `x` at the **rear**|O(1)|
|`dequeue()`|Remove element from the **front**|O(1)|
|`peek()` or `front()`|Get the front element (without removing)|O(1)|
|`isEmpty()`|Check if queue is empty|O(1)|
|`isFull()`|Check if queue is full (for fixed-size queue)|O(1)|

---

## 🧱 Implementation Methods

Queues can be implemented in **three main ways**:

### (a) Using Arrays

- Simple but has a limitation: the queue cannot grow beyond a fixed size.
    
- Problem: When elements are dequeued, empty spaces at the beginning are wasted.
    
- Solution: Use **circular queue**.
    

### (b) Using Linked List

- Dynamic size (no wasted space).
    
- Each node points to the next one.
    
- Easy to expand/shrink.
    

### (c) Using Stacks

- Possible but less efficient.
    
- Used for algorithmic tricks (like reversing queues or implementing recursion iteratively).
    

---

## Types of Queues

|Type|Description|
|---|---|
|**Simple Queue**|Basic FIFO queue.|
|**Circular Queue**|Rear connects back to front; avoids wasted space.|
|**Priority Queue**|Elements are dequeued based on priority, not arrival order.|
|**Deque (Double-Ended Queue)**|Elements can be added/removed from both ends.|
|**Input-Restricted Deque**|Insertion at one end, deletion from both.|
|**Output-Restricted Deque**|Deletion at one end, insertion from both.|

---

## Real-Life Analogies

|Real-world example|Data structure analog|
|---|---|
|People in a ticket line|Simple Queue|
|Circular track of cars in amusement park|Circular Queue|
|OS Process Scheduler|Priority Queue|
|Browser history (forward/backward)|Deque|

