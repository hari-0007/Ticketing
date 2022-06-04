# # import os
# # import sys
# #
# # python = sys.executable
# # os.execl(python, python, *sys.argv)
#
#
# import sched
# import time
# schedulerTest = sched.scheduler(time.time, time.sleep)
# def randomFunc(test = 'default'):
#     print("Testing Scheduler to Run Script Constantly.")
#     schedulerTest.enter(30, 1, randomFunc, ('checkThis',))
# schedulerTest.enter(30, 1, randomFunc, ('TestThis',))
# schedulerTest.run()

import time

while True:
    def randomFunctionYouWantToKeepRunning():
        print("Testing To Run Script in Background Every 10 secs.")

    randomFunctionYouWantToKeepRunning()
    time.sleep(10)
    