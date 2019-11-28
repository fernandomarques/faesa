from functools import lru_cache, wraps
from time import time

def timing(f):
    @wraps(f)
    def wrap(*args, **kw):
        ts = time()
        result = f(*args, **kw)
        te = time()
        print (f'func:{f.__name__} args:[{args}, {kw}] took: {te-ts} sec')
        return result
    return wrap
    


@lru_cache(maxsize = None)
@timing
def fib2(n):
    if n <= 1:
        return 1
    return fib2(n-1) + fib2(n-2)

@timing
def fib(n):
    if n <= 1:
        return 1
    return fib(n-1) + fib(n-2)

if __name__ == "__main__":
    fib(15)
    fib2(15)