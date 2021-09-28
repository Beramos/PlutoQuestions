#=
Created on Saturday 26 December 2020
Last update: Tuesday 28 September 2021

@author: Bram De Jaegher
bram.de.jaegher@gmail.com
=#

"""
The @safe macro is a hidden try-catch statement to avoid the Markdown admonitions to crash when
the user introduces an error in the exercise functions.

Usage:
-----
@safe test_func(input) == correct_output
@safe[test_func1(input) == correct_output1, test_func2(input) == correct_output2]

"""
macro safe(ex)
	safe_ex = quote
		try $(esc(ex))
		catch e 
			false
		end
	end
	return safe_ex
end


"""
The @terminal prints the output in the Pluto notebooks instead of the REPL. 
This is a convenience wrapper for `PlutoUI.with_terminal()`.

"""
macro terminal(ex)
	return quote
			PlutoUI.with_terminal() do
					$(esc(ex))
			end
	end
end