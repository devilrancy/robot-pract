import asynnc_test_file
import time
import sys
import logging

def run_async(func):
	"""
		run_async(func)
			function decorator, intended to make "func" run in a separate
			thread (asynchronously).
			Returns the created Thread object

			E.g.:
			@run_async
			def task1():
				do_something

			@run_async
			def task2():
				do_something_too

			t1 = task1()
			t2 = task2()
			...
			t1.join()
			t2.join()
	"""
	from threading import Thread
	from functools import wraps

	@wraps(func)
	def async_func(*args, **kwargs):
		func_hl = Thread(target = func, args = args, kwargs = kwargs)
		func_hl.start()
		return func_hl

	return async_func


@run_async
def asynchronously_start_system_1():
	print "SYSTEM101"

	time.sleep(2)
	print "SYSTEM102"
	time.sleep(2)
	print "SYSTEM103"

@run_async
def asynchronously_start_system_2():
	print "SYSTEM201"
	time.sleep(2)
	print "SYSTEM202"
	time.sleep(2)
	print "SYSTEM203"

def wait_until(*stuff):
	for something in stuff :
		something.join()


