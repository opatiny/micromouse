# Multitasking

## Using multiple tasks

We use freertos to run multiple tasks in parallel.

## Questions

- what are semaphores and how to use them?
- what are queues and how to use them?
- is there a max number of threads?
- how to use both cores?

## Tasks priorities

https://www.freertos.org/RTOS-task-priority.html

## Using both cores

Assign tasks either to core 0 or 1.

```cpp
void taskRobotMove() {
  xTaskCreatePinnedToCore(TaskRobotMove, "TaskRobotMove", 4096, NULL,
                          3, NULL, 0);  // attached on core 0!!
}
```

## Links

- discussion on multitasking: https://www.esp32.com/viewtopic.php?t=8944
- tasks and co-routines: https://www.freertos.org/taskandcr.html
- freertos docs: https://www.freertos.org/a00125.html
- round robin scheduling: https://en.wikipedia.org/wiki/Round-robin_scheduling#:~:text=Round%2Drobin%20(RR)%20is,also%20known%20as%20cyclic%20executive).
- microseconds delay in freertos: https://www.freertos.org/FreeRTOS_Support_Forum_Archive/December_2014/freertos_Microsecond_delay_within_task_edfcdf0fj.html
