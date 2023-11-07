from robot.api.deco import keyword



@keyword(name="Method One")
def method_1(value=1):
    value = value * 2
    return value