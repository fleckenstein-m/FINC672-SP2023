### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ ab6ac8d0-6d8a-11ed-0400-1b357312718e
md"""
# FINC 672 - Julia Fundamentals
"""

# ╔═╡ 42d2dc69-c5e8-4cb8-809b-19cae75e479d
begin
	html"""
	<fieldset>      
    <legend><b>Learning Objectives</b></legend>      
	<br>
	<input type="checkbox" value=""> Basic Julia Syntax
	<br>
	<input type="checkbox" value=""> Variables
	<br>
	<input type="checkbox" value=""> Boolean Operators and Numeric Comparisons
	<br>
	<input type="checkbox" value=""> Functions
	<br>
	<input type="checkbox" value=""> Control Flow and Loops
	<br>
	</fieldset>      
	"""
end

# ╔═╡ 3e72d672-8f55-4958-af43-6a43c3bbf830
#add button to trigger presentation mode
html"<button onclick='present()'>present</button>"

# ╔═╡ 15965456-03b5-41fc-bd5a-e0334f2e48f1
md"""
#
"""

# ╔═╡ 965c2f3a-7aed-48db-9f34-880812267c2a
md"""
- Today, we cover the basics of Julia as a programming language. Having a basic understanding of Julia will make you more effective and efficient in using Julia.
- This is going to be a very brief and not in-depth overview of the Julia language.
- If you are already familiar and comfortable with other programming languages, I encourage you to read [Julia’s documentation](https://docs.julialang.org/). 
"""

# ╔═╡ 3632139a-33f4-443c-b692-4f61adc77edd
md"""
# Variables
"""

# ╔═╡ 14fadd48-e6fe-475f-92b8-8970b6487c05
md"""
- Variables are values that you tell the computer to store with a specific name so that you can later recover or change its value.
- Julia has several types of variables but the most important are:
  - Integers: `Int64`
  - Real Numbers: `Float64`
  - Boolean: `Bool`
  - Strings: `String`
"""

# ╔═╡ 6d90d638-b7c1-4e0b-a1af-8b0cdfa943b2
md"""
#
"""

# ╔═╡ f406efa1-c642-498a-8bf4-cd4ddcd35f9f
md"""
- We create new variables by writing the variable name on the left and its value on the right, and in the middle, we use the `=` assignment operator.
- For example, let's define two new variables: `name` and `age`.
"""

# ╔═╡ ade0df3a-f591-4c55-8032-c83005daa18a
let
	name = "Julia"
end

# ╔═╡ 807e79b5-4c2c-446d-8018-8b1d43336255
let
	age = 9
end

# ╔═╡ 8e7f76a8-aef0-405f-b7e1-50ca7d98d6a1
md"""
#
"""

# ╔═╡ 13109b52-c7b4-4260-9607-9ab2793efef7
md"""
!!! note 
    In the two examples above, we used 
	```
	let
	
	end
	```
	- This is to ensure that the variables we define are only known to Julia inside the cell.
	- This means that we can redefine `name` and `age` somewhere else in the notebook.
	- If we leave out `let` and `end`, the writing `age = 10` somewhere else in the notebook will give us an error.
	- Within a cell, we can define new values for an existing variable. Julia will simply override the previous value with the new one.
"""

# ╔═╡ 9bf34305-6dec-46e2-95b4-c7b5d99a61e4
let
	age = 9
	age = 10
end

# ╔═╡ aef0ecc7-ad76-4888-ad41-e54123d16d07
md"""
#
"""

# ╔═╡ 9aacb4dd-4d6e-4b62-87fa-19e364b83c38
md"""
- We can also do operations on variables such as addition or division. For example, let's multiply age by 3:
"""

# ╔═╡ 40deef2b-c458-43ba-acad-7c02f5ae5787
let
	age = 10
	age * 3
end

# ╔═╡ 91a0bd38-0784-4123-876b-85d7361eb579
md"""
#
"""

# ╔═╡ 55a0a539-b89e-4544-9a8f-a6df6218c73b
md"""
- We can also do operations on a variable and update it. For example
"""

# ╔═╡ 5238a439-f5ee-4427-9533-b36965254a6d
let
	age = 10
	age = age + 7
	age
end

# ╔═╡ 33f27100-64c9-47ef-b60c-62beba7af90c
md"""
#
"""

# ╔═╡ cb046dfb-4007-4216-9743-9456e8e4d250
md"""
- We can inspect the types of variables by using the `typeof` function:
"""

# ╔═╡ 7ed413c6-c0e5-4b85-b4dc-08666c418b28
let
	age = 10
	typeof(age)
end

# ╔═╡ 25c65694-fee6-4a51-bef6-6e8226bf97a0
md"""
# Boolean Operators and Numeric Comparisons
"""

# ╔═╡ 1d0c2cab-9c8f-44ea-8a1a-df5a80cb4d63
md"""
- Now that we’ve covered types, we can move to boolean operators and numeric comparisons.
- We have three boolean operators in Julia:
  - `!`: __NOT__
  - `&&`: __AND__
  - `||`: __OR__
"""

# ╔═╡ 2d20bd5f-e43e-4ff6-9080-0166046c8223
md"""
#
"""

# ╔═╡ c94cad38-5363-4964-bc42-02010e0a506c
md"""
- Here are a few examples with some of them:
"""

# ╔═╡ 7d8602c2-5a98-472d-a660-15f5f4f60a16
!true

# ╔═╡ 82355982-8aeb-44e7-921f-7f99e4667c03
(false && true) || (!false)

# ╔═╡ 46fe46fb-a64d-4cb9-9556-9bdea3381a21
(6 isa Int64) && (6 isa Real)

# ╔═╡ c41f8840-5081-421e-9a2e-1b145f00b2ba
md"""
#
"""

# ╔═╡ aa452762-85fc-49c3-8e90-1da5d208d1b9
md"""
- Regarding numeric comparison, Julia has three major types of comparisons:
  1. Equality: either something is equal or not equal another
     - `==` "equal"
     - `!=` or `≠` "not equal"
  2. Less than: either something is less than or less than or equal to
     - `<` "less than"
     - `<=` or ≤ "less than or equal to"
  3. Greater than: either something is greater than or greater than or equal to
     - `>` "greater than"
     - `>=` or `≥` "greater than or equal to"
"""

# ╔═╡ 1c2d78ab-ab20-424f-a532-b9e26dbc34b5
md"""
#  
"""

# ╔═╡ 18716ab1-6ffc-43fa-a9b1-786effbce57d
md"""
- Examples
"""

# ╔═╡ 187e1fd0-b8ba-47d6-9857-5d36c195c2c9
1 == 1

# ╔═╡ c960a390-9194-48bc-b8c3-b38503d2fa76
1 >= 10

# ╔═╡ 29cf39dc-62c5-4a57-add9-32c96c5efb95
md"""
#
"""

# ╔═╡ ab728c25-7523-4f17-be2a-04f8d69a1182
md"""
- This even works between different types.
"""

# ╔═╡ aaa9341e-4a13-413e-a6ae-7217e6b5d021
1 == 1.0

# ╔═╡ e9b473dd-dda5-44df-958b-3eafe9d65cd1
md"""
- We can also mix and match boolean operators with numeric comparisons
"""

# ╔═╡ 17febe2d-ac87-496b-9ebe-25da47922967
(1 != 10) || (3.14 <= 2.71)

# ╔═╡ be960870-e0ff-49a3-b14b-dd7716edf25b
md"""
# Functions
"""

# ╔═╡ 6f182c16-b8f5-4835-9ce3-b21af62c5d5c
md"""
- Now that we already know how to define variables, let’s turn our attention to __functions__.
- In Julia, a function maps argument values to one or more return values
- The basic syntax is:
```
function function_name(arg1, arg2)
	result = stuff with the arg1 and arg2
return result
```
"""

# ╔═╡ e060e675-412f-4405-9bd1-eca0501a1b48
md"""
#
"""

# ╔═╡ d05e6344-74af-4fc6-b88d-6ec8204e1386
md"""
- The function declaration begins with the keyword `function` followed by the function name.
- Then, inside parentheses `()`, we define the arguments separated by a comma `,`.
- Inside the function, we specify what we want Julia to do with the parameters that we supplied.
  - All variables that we define inside a function are deleted after the function returns, this is nice because it is like an automatic cleanup.
  - After all the operations in the function body are finished, we instruct Julia to `return` the final result with the return statement.
- Finally, we let Julia know that the function definition is finished with the `end` keyword.
"""

# ╔═╡ 3dad3232-da88-4f40-8faf-6ecaf2cf90e5
md"""
#
"""

# ╔═╡ 217cdb78-2aa9-496e-9daa-f20f8e762bf3
md"""
Let’s dive into some examples. First, let’s create a new function that adds
numbers together:
"""

# ╔═╡ 2cb1933c-50ac-4fed-844b-52aee0f45b71
function add_numbers(x, y)
	return x + y
end

# ╔═╡ bbd1e1c4-11f8-4e9e-9b53-d5111fe83342
md"""
#
"""

# ╔═╡ 4dd59b38-5e55-4272-8570-650061cb9edb
md"""
- Now, we can use our `add_numbers` function:
"""

# ╔═╡ 4329e88e-ecbe-4336-b453-fc657d4a1621
add_numbers(17, 29)

# ╔═╡ b37b6554-e1fd-4742-a80e-1829b5abd015
md"""
And it works also with floats
"""

# ╔═╡ a0bd7251-d107-4546-bc55-36157dc2f526
add_numbers(3.14, 2.72)

# ╔═╡ 9a2f2002-9bc6-4386-a579-b3903f8b61e1
md"""
#
"""

# ╔═╡ 766f70c4-afc4-4e31-86f2-575ee5604d30
md"""
- A function can, also, return two or more values.
- See the new function `add_multiply` below
"""

# ╔═╡ b09bcf25-f482-4599-91ce-37781530d8f6
function add_multiply(x, y)
	
	addition = x + y
	multiplication = x * y
	
	return addition, multiplication
end

# ╔═╡ 5941aeae-096f-477d-9f8d-99d0de53b527
md"""
#
"""

# ╔═╡ d1f1e579-de69-4380-acee-9f8793f3f256
md"""
- In that case, we can do two things:
  1. We can, analogously as the return values, define two variables to hold the function return values, one for each return value
  2. Or we can define just one variable to hold the function return values and access them with either first or last.
"""

# ╔═╡ c756ea1a-af25-4152-85f2-7e75b9f18d5b
md"""
#
"""

# ╔═╡ 3b659642-6f7f-43ba-9f3d-99561a36e2c0
let
	return_1, return_2 = add_multiply(1, 2)
	
	return_2
end

# ╔═╡ ce6c05f7-a5a4-4380-bf19-b5e801df1c04
let
	all_returns = add_multiply(1, 2)

	last(all_returns)
end

# ╔═╡ 28e15a84-5b59-4732-ae2b-97398b75b987
md"""
# Conditional If-Else-Elseif
"""

# ╔═╡ 2d31ec89-d66f-441a-b3b5-9e6baaa77f8a
md"""
- In most programming languages, the user is allowed to control the computer’s flow of execution.
- Depending on the situation, we want the computer to do one thing or another.
- In Julia we can control the flow of execution with `if`, `elseif` and `else` keywords. These are known as conditional statements
"""

# ╔═╡ 33e4df84-304e-4047-a8bc-c9f97bc8ab38
md"""
#
"""

# ╔═╡ 7da6031d-600a-4100-ba62-0e312052eba7
md"""
- `if` keyword prompts Julia to evaluate an expression and depending on whether `true` or `false` certain portions of code will be executed.
- We can compound several `if` conditions with the `elseif` keyword for complex control flow.
- Finally, we can define an alterative portion to be executed if anything inside the `if` or `elseif`‘s is evaluated to `true`.
- This is the purpose of the `else` keyword.
- Finally, like all the previous keyword operators that we saw, we must tell Julia when the conditional statement is finished with the `end` keyword.
"""

# ╔═╡ 62c6d81a-4859-4dc5-9714-b44c117f6aca
md"""
#
"""

# ╔═╡ e8f7c3ce-256a-4291-b1e4-73dd0c11329d
md"""
- Here's an example with all the `if-elseif-else` keywords:
"""

# ╔═╡ b5d6e2ae-5ea1-4ed6-9a9e-8bf9c108e46c
let
	
	a = 1
	b = 2

	if a < b
		"a is less than b"
	elseif a > b
		"a is greater than b"
	else
		"a is equal to b"
	end
	
end

# ╔═╡ 44d36e73-fb3b-4c12-83c7-cc4875927d8d
md"""
#
"""

# ╔═╡ 5766ea83-6a34-4968-88f2-387337e06499
md"""
- We can even wrap this in a function called `compare`:
"""

# ╔═╡ 69addfa3-5a79-45fe-a05e-ccfd5e877722
function compare(a, b)
	if a < b
	"a is less than b"
	elseif a > b
	"a is greater than b"
	else
	"a is equal to b"
	end
end

# ╔═╡ ce2dbd2a-a5b8-4b9f-9ea6-3932029f4069
compare(3.14, 3.14)

# ╔═╡ 01cd64f7-e024-4def-a8b7-0a03f4276033
md"""
# For Loop
"""

# ╔═╡ 7b3bd5e1-7460-4c71-981b-c13176cf8b3d
md"""
- The classical for loop in Julia follows a similar syntax as the conditional statements.
- You begin with a keyword, in this case `for`.
- Then, you specify what Julia should "loop" for, i.e., a sequence.
- Also, like everything else, you must finish with the `end` keyword.
"""

# ╔═╡ 31338853-5fce-41d8-8366-a0cd5cd8e1ac
md"""
#
"""

# ╔═╡ 8134e48e-0f43-44f4-93ef-91cbef4e7442
md"""
So, to make Julia print every number from 1 to 10, you can use the following for
loop:
"""

# ╔═╡ cb389ce1-19b2-447e-af81-27b040b94ee5
for i in 1:10
	println(i)
end

# ╔═╡ 9d85e2dd-e003-4b89-92c4-7f863583770f
md"""
# While Loop
"""

# ╔═╡ a9694818-e967-431c-858c-a5e30f56962b
md"""
- The while loop is a mix of the previous conditional statements and for loops.
- Here, the loop is executed every time the condition is true.
- The syntax follows the same fashion as the previous one.
- We begin with the keyword `while`, followed by the statement to evaluated as either `true`.
- Like previously, you must end with the `end` keyword.
"""

# ╔═╡ 0a8e4dec-f313-49e6-9998-9690ae07b3e1
md"""
#
"""

# ╔═╡ 6d951c8d-22f5-4d6d-b4e8-13bf62b28bea
md"""
- Here’s an example
"""

# ╔═╡ f7da342c-f5ea-4a8c-b2ed-a7ebafb0ef6d
let

	n = 0
	
	while n < 3
		n += 1
	end

	n
end

# ╔═╡ a124bf84-7ca4-40c8-8607-b05dec24a730
md"""
# Wrap-Up
"""

# ╔═╡ 75672e0c-5c34-44c8-b1a9-f6ba821d6c8d
begin
	html"""
	<fieldset>      
    <legend><b>Learning Objectives</b></legend>      
	<br>
	<input type="checkbox" value="" checked> Basic Julia Syntax
	<br>
	<input type="checkbox" value="" checked> Variables
	<br>
	<input type="checkbox" value="" checked> Boolean Operators and Numeric Comparisons
	<br>
	<input type="checkbox" value="" checked> Functions
	<br>
	<input type="checkbox" value="" checked> Control Flow and Loops
	<br>
	</fieldset>      
	"""
end

# ╔═╡ 5f191192-bc5f-41e8-845c-beba89ee5841
md"""
#
"""

# ╔═╡ cddc45e1-7547-4d34-bc12-b08a5320a62c
begin
# helper functions
	
#Creates a foldable cell
struct Foldable{C}
	title::String
	content::C
end

function Base.show(io, mime::MIME"text/html", fld::Foldable)
	write(io,"<details><summary>$(fld.title)</summary><p>")
	show(io, mime, fld.content)
	write(io,"</p></details>")
end

	
#Two-column cell
struct TwoColumn{A, B}
	left::A
	right::B
end

function Base.show(io, mime::MIME"text/html", tc::TwoColumn)
	write(io,
		"""
		<div style="display: flex;">
			<div style="flex: 50%;">
		""")
	show(io, mime, tc.left)
	write(io,
		"""
			</div>
			<div style="flex: 50%;">
		""")
	show(io, mime, tc.right)
	write(io,
		"""
			</div>
		</div>
	""")
end


#Sets the height of displayed tables
html"""<style>
	pluto-output.scroll_y {
		max-height: 550px; /* changed this from 400 to 550 */
	}
"""

#Define html elements
nbsp = html"&nbsp" #non-breaking space
vspace = html"""<div style="margin-bottom:0.05cm;"></div>"""
br = html"<br>"
	
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╟─ab6ac8d0-6d8a-11ed-0400-1b357312718e
# ╟─42d2dc69-c5e8-4cb8-809b-19cae75e479d
# ╟─3e72d672-8f55-4958-af43-6a43c3bbf830
# ╟─15965456-03b5-41fc-bd5a-e0334f2e48f1
# ╟─965c2f3a-7aed-48db-9f34-880812267c2a
# ╟─3632139a-33f4-443c-b692-4f61adc77edd
# ╟─14fadd48-e6fe-475f-92b8-8970b6487c05
# ╟─6d90d638-b7c1-4e0b-a1af-8b0cdfa943b2
# ╟─f406efa1-c642-498a-8bf4-cd4ddcd35f9f
# ╠═ade0df3a-f591-4c55-8032-c83005daa18a
# ╠═807e79b5-4c2c-446d-8018-8b1d43336255
# ╟─8e7f76a8-aef0-405f-b7e1-50ca7d98d6a1
# ╟─13109b52-c7b4-4260-9607-9ab2793efef7
# ╠═9bf34305-6dec-46e2-95b4-c7b5d99a61e4
# ╟─aef0ecc7-ad76-4888-ad41-e54123d16d07
# ╟─9aacb4dd-4d6e-4b62-87fa-19e364b83c38
# ╠═40deef2b-c458-43ba-acad-7c02f5ae5787
# ╟─91a0bd38-0784-4123-876b-85d7361eb579
# ╟─55a0a539-b89e-4544-9a8f-a6df6218c73b
# ╠═5238a439-f5ee-4427-9533-b36965254a6d
# ╟─33f27100-64c9-47ef-b60c-62beba7af90c
# ╟─cb046dfb-4007-4216-9743-9456e8e4d250
# ╠═7ed413c6-c0e5-4b85-b4dc-08666c418b28
# ╟─25c65694-fee6-4a51-bef6-6e8226bf97a0
# ╟─1d0c2cab-9c8f-44ea-8a1a-df5a80cb4d63
# ╟─2d20bd5f-e43e-4ff6-9080-0166046c8223
# ╟─c94cad38-5363-4964-bc42-02010e0a506c
# ╠═7d8602c2-5a98-472d-a660-15f5f4f60a16
# ╠═82355982-8aeb-44e7-921f-7f99e4667c03
# ╠═46fe46fb-a64d-4cb9-9556-9bdea3381a21
# ╟─c41f8840-5081-421e-9a2e-1b145f00b2ba
# ╟─aa452762-85fc-49c3-8e90-1da5d208d1b9
# ╟─1c2d78ab-ab20-424f-a532-b9e26dbc34b5
# ╟─18716ab1-6ffc-43fa-a9b1-786effbce57d
# ╠═187e1fd0-b8ba-47d6-9857-5d36c195c2c9
# ╠═c960a390-9194-48bc-b8c3-b38503d2fa76
# ╟─29cf39dc-62c5-4a57-add9-32c96c5efb95
# ╟─ab728c25-7523-4f17-be2a-04f8d69a1182
# ╠═aaa9341e-4a13-413e-a6ae-7217e6b5d021
# ╟─e9b473dd-dda5-44df-958b-3eafe9d65cd1
# ╠═17febe2d-ac87-496b-9ebe-25da47922967
# ╟─be960870-e0ff-49a3-b14b-dd7716edf25b
# ╟─6f182c16-b8f5-4835-9ce3-b21af62c5d5c
# ╟─e060e675-412f-4405-9bd1-eca0501a1b48
# ╟─d05e6344-74af-4fc6-b88d-6ec8204e1386
# ╟─3dad3232-da88-4f40-8faf-6ecaf2cf90e5
# ╟─217cdb78-2aa9-496e-9daa-f20f8e762bf3
# ╠═2cb1933c-50ac-4fed-844b-52aee0f45b71
# ╟─bbd1e1c4-11f8-4e9e-9b53-d5111fe83342
# ╟─4dd59b38-5e55-4272-8570-650061cb9edb
# ╠═4329e88e-ecbe-4336-b453-fc657d4a1621
# ╟─b37b6554-e1fd-4742-a80e-1829b5abd015
# ╠═a0bd7251-d107-4546-bc55-36157dc2f526
# ╟─9a2f2002-9bc6-4386-a579-b3903f8b61e1
# ╟─766f70c4-afc4-4e31-86f2-575ee5604d30
# ╠═b09bcf25-f482-4599-91ce-37781530d8f6
# ╟─5941aeae-096f-477d-9f8d-99d0de53b527
# ╟─d1f1e579-de69-4380-acee-9f8793f3f256
# ╟─c756ea1a-af25-4152-85f2-7e75b9f18d5b
# ╠═3b659642-6f7f-43ba-9f3d-99561a36e2c0
# ╠═ce6c05f7-a5a4-4380-bf19-b5e801df1c04
# ╟─28e15a84-5b59-4732-ae2b-97398b75b987
# ╟─2d31ec89-d66f-441a-b3b5-9e6baaa77f8a
# ╟─33e4df84-304e-4047-a8bc-c9f97bc8ab38
# ╟─7da6031d-600a-4100-ba62-0e312052eba7
# ╟─62c6d81a-4859-4dc5-9714-b44c117f6aca
# ╟─e8f7c3ce-256a-4291-b1e4-73dd0c11329d
# ╠═b5d6e2ae-5ea1-4ed6-9a9e-8bf9c108e46c
# ╟─44d36e73-fb3b-4c12-83c7-cc4875927d8d
# ╟─5766ea83-6a34-4968-88f2-387337e06499
# ╠═69addfa3-5a79-45fe-a05e-ccfd5e877722
# ╟─ce2dbd2a-a5b8-4b9f-9ea6-3932029f4069
# ╟─01cd64f7-e024-4def-a8b7-0a03f4276033
# ╟─7b3bd5e1-7460-4c71-981b-c13176cf8b3d
# ╟─31338853-5fce-41d8-8366-a0cd5cd8e1ac
# ╟─8134e48e-0f43-44f4-93ef-91cbef4e7442
# ╠═cb389ce1-19b2-447e-af81-27b040b94ee5
# ╟─9d85e2dd-e003-4b89-92c4-7f863583770f
# ╟─a9694818-e967-431c-858c-a5e30f56962b
# ╟─0a8e4dec-f313-49e6-9998-9690ae07b3e1
# ╟─6d951c8d-22f5-4d6d-b4e8-13bf62b28bea
# ╠═f7da342c-f5ea-4a8c-b2ed-a7ebafb0ef6d
# ╟─a124bf84-7ca4-40c8-8607-b05dec24a730
# ╟─75672e0c-5c34-44c8-b1a9-f6ba821d6c8d
# ╟─5f191192-bc5f-41e8-845c-beba89ee5841
# ╟─cddc45e1-7547-4d34-bc12-b08a5320a62c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
