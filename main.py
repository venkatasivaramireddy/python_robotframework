# this main.py file, i used to initialize all the robot testcases

from robot import run

run('Test/Test_Cases/windows-os-testcases.robot',include=[' windows-sample'])
#
# run('Test/Test_Cases/class_test.robot')
# run('Test/Test_Cases/class_test.robot',include=['Multiply'])

# run('Test/Test_Cases/First_test.robot', include=['tag1', 'tag2'], splitlog=True)
# with open('stdout.txt', 'w') as stdout:
#     run('t1.robot', 't2.robot', name='Example', log=None, stdout=stdout)



"""
1. need to execute robot test cases from python script
2. need to save output report in folder format
3. Test case with control & conditional & Exception statements

how to automate API releated testcases
hot to automate windows OS relates testcase
how to automate linux os related testcase
hot to automate WebUI related testcase
"""
