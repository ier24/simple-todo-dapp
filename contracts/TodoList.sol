// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
    event Created(uint256 id, string content);
    event UpdateIsCompleted(uint256 id, bool isCompleted);

    struct Task {
        string content;
        bool isCompleted;
    }

    uint256 public taskCount = 0;
    mapping(uint256 => Task) public tasks;

    constructor() {
        createTask("Initial Data");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(_content, false);
        emit Created(taskCount, _content);
    }

    function toggleIsCompleted(uint256 _id) public {
        Task memory _task = tasks[_id];
        _task.isCompleted = !_task.isCompleted;
        tasks[_id] = _task;
        emit UpdateIsCompleted(_id, _task.isCompleted);
    }
}
