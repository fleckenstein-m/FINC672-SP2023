### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ ab6ac8d0-6d8a-11ed-0400-1b357312718e
md"""
# FINC 672 - Julia Data Structures II
"""

# ╔═╡ 42d2dc69-c5e8-4cb8-809b-19cae75e479d
begin
	html"""
	<fieldset>      
    <legend><b>Learning Objectives</b></legend>      
	<br>
	<input type="checkbox" value=""> Broadcasting Operators and Functions
	<br>
	<input type="checkbox" value=""> Comprehensions
	<br>
	<input type="checkbox" value=""> Iteration
	<br>
	<input type="checkbox" value=""> Matrices
	<br>
	<br>
	</fieldset>      
	"""
end

# ╔═╡ 3e72d672-8f55-4958-af43-6a43c3bbf830
#add button to trigger presentation mode
html"<button onclick='present()'>present</button>"

# ╔═╡ cc7cbf20-9ab5-41e1-967a-f426183246a5
md"""
# Broadcasting
"""

# ╔═╡ 72eaafb9-4130-43fa-b2c5-536509aa5bd5
md"""
- For mathematical operations, like `*` (multiplication) or `+` (addition), we can broadcast it using the dot operator `.`
- For example, broadcasted addition would imply changing the `+` to `.+`
"""

# ╔═╡ c5568d49-9a87-4224-bdf5-4365d77a44e4
[1, 2, 3] .+ 1

# ╔═╡ 422dd2fc-9103-4fab-8e0a-e5026c7c221e
md"""
#
"""

# ╔═╡ fb14b35e-894f-4212-85e0-cbc15b029699
md"""
- It also works with functions automatically.
- Let’s use the logarithm function
"""

# ╔═╡ c772d04b-c584-45b0-8935-b8c643fa19b3
log.([1, 2, 3])

# ╔═╡ 9b42d9b9-6a21-4b77-8a86-2176c642a31f
md"""
#
"""

# ╔═╡ 3f510cf6-1412-493a-944a-ce6a97e10c58
md"""
- We can broadcast operators.
"""

# ╔═╡ 93ea5c80-8dc9-42f7-860a-09a797ae4047
begin
	
	my_example_matrix = [[1 2 3]
						 [4 5 6]
						 [7 8 9]]
	
	my_example_matrix .+ 100
	
end

# ╔═╡ 448bb57c-95c9-4bbc-8e06-5b177802b5eb
md"""
#
"""

# ╔═╡ 43d8ae9e-2673-4e58-8f9a-879da43d1239
md"""
- We can use `map` to apply a function to every element of an array.
"""

# ╔═╡ 0539004a-3552-4f7d-b13a-8161a247c00a
map(log, my_example_matrix)

# ╔═╡ 24be1cc2-e132-477f-92dc-5defe2d3de4b
md"""
#
"""

# ╔═╡ c671e317-3d47-4f33-a7a8-3e0389d3b883
md"""
- It also accepts an anonymous function
"""

# ╔═╡ f80aa11f-6246-4d36-92e3-8673b07e3d11
map(x -> x*3, my_example_matrix)

# ╔═╡ 80402620-7794-44f3-b31d-5d33e64995e1
md"""
#
"""

# ╔═╡ 51a6042d-3999-423a-ac54-71ed9d856474
md"""
- It also works with slicing
"""

# ╔═╡ e21e99b0-507c-461d-8219-71c703f9f163
map(x -> x + 100, my_example_matrix[:, 3])

# ╔═╡ dadc0dbe-ce9c-4285-b26c-fb64a80923d2
md"""
#
"""

# ╔═╡ f7beec98-52e5-4d0b-9785-b5fc2db99470
md"""
- Finally, sometimes, and specially when dealing with tabular data, we want to apply a function over all elements in a specific array dimension.
- This can be done with the `mapslices` function.
- Similar to map, the first argument is the function and the second argument is the array.
- The only change is that we need to specify the dims argument to flag what dimension we want to transform the elements.
- For example let’s use `mapslice` with the sum function on both rows (dims=1) and columns (dims=2).
"""

# ╔═╡ 78fd769b-a6b2-46b6-94ea-3370a5bc326c
md"""
#
"""

# ╔═╡ 2079c244-bf83-4c61-9842-cbb7c2bb159d
mapslices(sum, my_example_matrix; dims=1)

# ╔═╡ 1d6c6e65-86ef-4db6-8f5b-058289b275a1
mapslices(sum, my_example_matrix; dims=2)

# ╔═╡ 5a4d3d4f-83f2-41c9-a19f-9c1ff1cb7b60
md"""
# Comprehensions
"""

# ╔═╡ 1f4d07cc-38cf-4104-8085-e7ee9ef9d5e9
md"""
- It is often useful to use a comprehension as a basic programming construct.
- A typical form of a comprehension is: `[f(x) for x in A]`
"""

# ╔═╡ 95260162-89e5-47e8-9583-1562a2b77aac
[(2n+1)^2 for n in 1:5]

# ╔═╡ 7dcc6788-30f6-42ce-9671-858568bca59b
md"""
# Array Comprehensions
"""

# ╔═╡ 7b6c4d93-8cc7-4821-bd3e-dc3369c46086
md"""
- Another powerful way to create arrays are `array comprehensions`.
- You specify what you want to do inside the `[]` brackets.
- For example, say we want to create a vector of squares from 1 to 100.
"""

# ╔═╡ b748c58b-1484-4060-9b49-502b298152fb
[x^2 for x in 1:10]

# ╔═╡ 6aa79928-1a44-4baa-bd42-f229c4687076
md"""
#
"""

# ╔═╡ 9c3b32a2-2cef-4af8-8906-c80afab33a40
md"""
- They also support multiple inputs
"""

# ╔═╡ 28e29d50-66ac-46ba-bb2b-1039b4fa2d4d
[x*y for x in 1:7 for y in 1:2]

# ╔═╡ 0d49845b-dc0d-4a80-9bd2-496cc6abc92d
md"""
- And conditionals.
"""

# ╔═╡ 09e409ab-d985-49ee-9005-88e0546ab767
[x^2 for x in 1:10 if isodd(x)]

# ╔═╡ 7b5d928f-b21b-45d8-9afe-623f8b863998
md"""
#
"""

# ╔═╡ cbe904d1-6bae-4d5d-94a6-8ba7458c6c49
md"""
- As with array literals you can specify your desired type before the `[]` brackets
"""

# ╔═╡ b2c048cb-43a7-4e17-9766-d664967e8195
Float64[x^2 for x in 1:10 if isodd(x)]

# ╔═╡ 7e666183-bd75-4ddb-b51c-fad757f6fd8c
md"""
# Array Iteration
"""

# ╔═╡ 53c8d369-91cd-4bca-97b0-89583aedf21b
md"""
- One common operation is to iterate over an array with a `for` loop.
- The regular for `loop` over an array returns each element.
"""

# ╔═╡ c119e9a3-4710-4751-8fac-6bf49725ee13
let
	simple_vector = [1, 2, 3]
	empty_vector = Int64[]

	for i in simple_vector
		push!(empty_vector, i + 1)
	end

	empty_vector
	
end

# ╔═╡ 4e8b241b-19b6-4081-acbf-8f617f700029
md"""
#
"""

# ╔═╡ 384f7801-28c0-45cd-bd09-5d13cb1f1cbd
md"""
- Sometimes you don’t want to loop over each element, but actually over each array index. 
- We can use the `eachindex` function combined with a for `loop` to iterate over each array index.
"""

# ╔═╡ 39f96d90-5d40-4a20-b033-3303d856538b
let
	forty_two_vector = [42, 42, 42]
	empty_vector = Int64[]

	for i in eachindex(forty_two_vector)
		push!(empty_vector, i)
	end

	empty_vector
	
end

# ╔═╡ 49c44c27-bc74-42ca-ac14-a916c9b71723
md"""
# Matrix Iteration
"""

# ╔═╡ 48983b39-90f0-488d-94a1-990e04ba3322
md"""
- Iterating over matrices involves more details.
- The standard for `loop` goes first over columns then over rows.
- It will first traverse all elements in column 1, from the first row to the last row, then it will move to column 2 in a similar fashion until it has covered all columns.
"""

# ╔═╡ cab0f2ae-447d-4623-a804-110206275849
md"""
#
"""

# ╔═╡ 792eb8bf-b2bf-44a6-bbbd-b4f9353bf0b8
md"""
- First example.
"""

# ╔═╡ 1c2b0dcf-912a-4738-8023-20569ab30b4f
let
	column_major = [[1 2]
					[3 4]]

	empty_vector = Int64[]

	for i in column_major
		push!(empty_vector, i)
	end

	empty_vector
	
end

# ╔═╡ 98b07f4a-3bfe-49d5-a2f1-cdf97078b795
md"""
#
"""

# ╔═╡ 8b23904c-2c16-4d54-b746-1b180c38217a
md"""
- Second example.
"""

# ╔═╡ 96e71174-fdb3-417f-8a3e-d841e2f6ffcf
let
	row_major = [[1 3]
	             [2 4]]
	
	empty_vector = Int64[];

	for i in row_major
		push!(empty_vector, i)
	end
	
	empty_vector
end

# ╔═╡ a931a810-7882-4718-97dc-70d11217d8e6
md"""
#
"""

# ╔═╡ 328e958b-2acb-41cf-beda-85e6c04807fb
md"""
- There are some handy functions to iterate over matrices.
- `eachcol`: iterates over an array column first.
- `eachrow`: iterates over an array row first.
"""

# ╔═╡ eb1e8ba7-ca57-4780-85a5-277ffd33f7b4
md"""
#
"""

# ╔═╡ a85da6f5-ee7c-4f44-9db0-7c406f1bcf80
md"""
- Example with `eachcol`
"""

# ╔═╡ 30bf2b50-0703-42d7-a591-050530b655fd
let

	column_major = [[1 2]
					[3 4]]

	row_major = [[1 3]
	             [2 4]]

	first(eachcol(column_major))
	
end


# ╔═╡ f4535587-3ac3-4d6d-a3d3-b867d946e583
md"""
#
"""

# ╔═╡ 94338483-74a1-478a-badc-84431f8dfe45
md"""
- Example with `eachrow`
"""

# ╔═╡ 358fbc00-485f-4f21-ab7c-a2f431fef8b5
let

	column_major = [[1 2]
					[3 4]]

	row_major = [[1 3]
	             [2 4]]

	first(eachrow(column_major))
	
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
	<input type="checkbox" value="" checked> Broadcasting Operators and Functions
	<br>
	<input type="checkbox" value="" checked> Comprehensions
	<br>
	<input type="checkbox" value="" checked> Iteration
	<br>
	<input type="checkbox" value="" checked> Matrices
	<br>
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
# ╟─cc7cbf20-9ab5-41e1-967a-f426183246a5
# ╟─72eaafb9-4130-43fa-b2c5-536509aa5bd5
# ╠═c5568d49-9a87-4224-bdf5-4365d77a44e4
# ╟─422dd2fc-9103-4fab-8e0a-e5026c7c221e
# ╟─fb14b35e-894f-4212-85e0-cbc15b029699
# ╠═c772d04b-c584-45b0-8935-b8c643fa19b3
# ╟─9b42d9b9-6a21-4b77-8a86-2176c642a31f
# ╟─3f510cf6-1412-493a-944a-ce6a97e10c58
# ╠═93ea5c80-8dc9-42f7-860a-09a797ae4047
# ╟─448bb57c-95c9-4bbc-8e06-5b177802b5eb
# ╟─43d8ae9e-2673-4e58-8f9a-879da43d1239
# ╠═0539004a-3552-4f7d-b13a-8161a247c00a
# ╟─24be1cc2-e132-477f-92dc-5defe2d3de4b
# ╟─c671e317-3d47-4f33-a7a8-3e0389d3b883
# ╠═f80aa11f-6246-4d36-92e3-8673b07e3d11
# ╟─80402620-7794-44f3-b31d-5d33e64995e1
# ╟─51a6042d-3999-423a-ac54-71ed9d856474
# ╠═e21e99b0-507c-461d-8219-71c703f9f163
# ╟─dadc0dbe-ce9c-4285-b26c-fb64a80923d2
# ╟─f7beec98-52e5-4d0b-9785-b5fc2db99470
# ╟─78fd769b-a6b2-46b6-94ea-3370a5bc326c
# ╠═2079c244-bf83-4c61-9842-cbb7c2bb159d
# ╠═1d6c6e65-86ef-4db6-8f5b-058289b275a1
# ╟─5a4d3d4f-83f2-41c9-a19f-9c1ff1cb7b60
# ╟─1f4d07cc-38cf-4104-8085-e7ee9ef9d5e9
# ╠═95260162-89e5-47e8-9583-1562a2b77aac
# ╟─7dcc6788-30f6-42ce-9671-858568bca59b
# ╟─7b6c4d93-8cc7-4821-bd3e-dc3369c46086
# ╠═b748c58b-1484-4060-9b49-502b298152fb
# ╟─6aa79928-1a44-4baa-bd42-f229c4687076
# ╟─9c3b32a2-2cef-4af8-8906-c80afab33a40
# ╠═28e29d50-66ac-46ba-bb2b-1039b4fa2d4d
# ╟─0d49845b-dc0d-4a80-9bd2-496cc6abc92d
# ╠═09e409ab-d985-49ee-9005-88e0546ab767
# ╟─7b5d928f-b21b-45d8-9afe-623f8b863998
# ╟─cbe904d1-6bae-4d5d-94a6-8ba7458c6c49
# ╠═b2c048cb-43a7-4e17-9766-d664967e8195
# ╟─7e666183-bd75-4ddb-b51c-fad757f6fd8c
# ╟─53c8d369-91cd-4bca-97b0-89583aedf21b
# ╠═c119e9a3-4710-4751-8fac-6bf49725ee13
# ╟─4e8b241b-19b6-4081-acbf-8f617f700029
# ╟─384f7801-28c0-45cd-bd09-5d13cb1f1cbd
# ╠═39f96d90-5d40-4a20-b033-3303d856538b
# ╟─49c44c27-bc74-42ca-ac14-a916c9b71723
# ╟─48983b39-90f0-488d-94a1-990e04ba3322
# ╟─cab0f2ae-447d-4623-a804-110206275849
# ╟─792eb8bf-b2bf-44a6-bbbd-b4f9353bf0b8
# ╠═1c2b0dcf-912a-4738-8023-20569ab30b4f
# ╟─98b07f4a-3bfe-49d5-a2f1-cdf97078b795
# ╟─8b23904c-2c16-4d54-b746-1b180c38217a
# ╠═96e71174-fdb3-417f-8a3e-d841e2f6ffcf
# ╟─a931a810-7882-4718-97dc-70d11217d8e6
# ╟─328e958b-2acb-41cf-beda-85e6c04807fb
# ╟─eb1e8ba7-ca57-4780-85a5-277ffd33f7b4
# ╟─a85da6f5-ee7c-4f44-9db0-7c406f1bcf80
# ╠═30bf2b50-0703-42d7-a591-050530b655fd
# ╟─f4535587-3ac3-4d6d-a3d3-b867d946e583
# ╟─94338483-74a1-478a-badc-84431f8dfe45
# ╠═358fbc00-485f-4f21-ab7c-a2f431fef8b5
# ╟─a124bf84-7ca4-40c8-8607-b05dec24a730
# ╟─75672e0c-5c34-44c8-b1a9-f6ba821d6c8d
# ╟─5f191192-bc5f-41e8-845c-beba89ee5841
# ╟─cddc45e1-7547-4d34-bc12-b08a5320a62c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
