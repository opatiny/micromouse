# Common programming errors and possible causes

## Core 1 panic'ed

The core panics which causes the device to reboot all of the time. This error is generally related to the multiple threads running in parallel. We identified two main causes:

1. No `vTaskDelay` in the `while` loop: without a delay in the loop the hand can never be given to the other tasks, which causes the device to crash.
2. Insufficient stack size of the task: If the tasks takes more memory than it was allocated it generate a stack overflow which crashes the device.
