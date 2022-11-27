### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ ab6ac8d0-6d8a-11ed-0400-1b357312718e
md"""
# FINC 672 - Julia Data Structures I
"""

# ╔═╡ 42d2dc69-c5e8-4cb8-809b-19cae75e479d
begin
	html"""
	<fieldset>      
    <legend><b>Learning Objectives</b></legend>      
	<br>
	<input type="checkbox" value=""> Array, Vector
	<br>
	<input type="checkbox" value=""> Array Inspection
	<br>
	<input type="checkbox" value=""> Concatenation
	<br>
	<input type="checkbox" value=""> Indexing, Slicing
	<br>
	<input type="checkbox" value=""> Array Manipulation
	<br>
	<br>
	</fieldset>      
	"""
end

# ╔═╡ 3e72d672-8f55-4958-af43-6a43c3bbf830
#add button to trigger presentation mode
html"<button onclick='present()'>present</button>"

# ╔═╡ 3b735bec-07fe-42cc-903f-7be58c7d0b5c
md"""
# Arrays and Vectors
"""

# ╔═╡ a80e0671-4028-4c13-9245-ed2833b14507
md"""
- Arrays are a systematic arrangement of similar objects, usually in rows and columns.
- Let’s start with arrays types. There are several, but we will focus on two.
  - `Vector{T}`: one-dimensional array. Alias for `Array{T, 1}`.
  - `Matrix{T}`: two-dimensional array. Alias for `Array{T, 2}`.
  - For example, `Vector{Int64}` is a __Vector__ which all elements are `Int64`s and `Matrix{Float64}` is a Matrix in which all elements are subtypes of `Float64`.
- Most of the time, especially when dealing with tabular data, we are using either one- or two-dimensional arrays.
- We can use the aliases Vector and Matrix for clear and concise syntax
"""

# ╔═╡ 726fb7b2-fd76-4a5f-8df3-219ac81128a1
md"""
# Array Construction
"""

# ╔═╡ 71a59a18-3d2f-4eec-8da0-3ca22c422c69
md"""
- How do we construct an array? The simplest answer is to use the default constructor.
- It accepts the element type as the type parameter inside the `{}` brackets and inside the constructor you pass the element type followed by the dimensions.
- It is common to initialize vector and matrices with undefined elements by using the `undef` argument for type.
"""

# ╔═╡ 4bcf1a6e-3931-4124-b069-aec95d555ffb
md"""
#
"""

# ╔═╡ 1839b7b9-8070-4605-929d-a5bbebb586be
md"""
- For example, a vector of 10 undef Float64 elements can be constructed as
"""

# ╔═╡ b2a58ad4-025a-4e76-8622-9eff84867fd8
let
	my_vector = Vector{Float64}(undef, 10)
end

# ╔═╡ 84c3bb84-62c1-4062-89b0-c3958c00dfc7
md"""
#
"""

# ╔═╡ 933cd76a-992c-4279-b7b9-bb1aaa8c643d
md"""
- For matrices, we need to pass two dimensions arguments inside the constructor: one for rows and another for columns.
- For example, a matrix with 10 rows, 2 columns is instantiated as.
"""

# ╔═╡ 27643565-c0de-452a-a54b-fa769a4fb599
let
	my_matrix = Matrix{Float64}(undef, 10, 2)
end

# ╔═╡ 556e7453-e960-44cc-97d1-1d9e52054e9a
md"""
#
"""

# ╔═╡ 51b7e526-114d-4c59-887f-293cee6ac1e6
md"""
- We also have some syntax aliases for the most common elements in array construction.
- `zeros` for all elements being initialized to value zero.
"""

# ╔═╡ 41916a78-dd3d-481c-9eaf-e6e59ce62b7c
let
	my_vector_zeros = zeros(10)
end

# ╔═╡ de07142f-c954-4e7c-8311-bb14c1f19f6a
md"""
#
"""

# ╔═╡ 760f526d-231b-411e-ba54-4af6a7ff6128
let
	my_matrix_zeros = zeros(Int64, 10, 2)
end

# ╔═╡ 29084f06-4c3c-43f0-abdd-6e0019ca62d6
md"""
#
"""

# ╔═╡ 9115d5f2-51d1-436a-b537-fc6a9ce0f29e
md"""
- `ones` for all elements being initialized to value one.
"""

# ╔═╡ 8861dedb-facc-42c6-87ab-42a623f2e0f5
let
	my_vector_ones = ones(Int64, 10)
end

# ╔═╡ e0d056a3-ded8-4ee9-b538-d8333290c2de
let
	my_matrix_ones = ones(10, 2)
end

# ╔═╡ ebfcfe2b-a754-4102-a57d-d4201f1c533c
md"""
#
"""

# ╔═╡ 02ae1f16-2fab-46da-a8d1-0b2352f63741
md"""
- For other elements we can first intantiate an array with `undef` elements and use the `fill!` function to fill all elements of an array with the desired element.
- Here’s an example with 3.14 ($\pi$).
"""

# ╔═╡ 0e651f7a-23fc-47ed-a669-fa057dd550d6
let
	my_matrix_π = Matrix{Float64}(undef, 2, 2);
	
	fill!(my_matrix_π, 3.14)
end

# ╔═╡ 8460e092-cb1f-4695-8a27-f405af12ef97
md"""
#
"""

# ╔═╡ e6c3b951-c354-41ab-bac8-ab1d8ebb675b
md"""
- We can also create arrays with `array literals`.
- For example a 2x2 matrix of integers.
"""

# ╔═╡ 1d9439b4-81fe-4301-8d44-704fbbb7a3fb
[[1 2]
 [3 4]]

# ╔═╡ dc687845-dde8-4fec-9a15-ad72eaf00dc9
md"""
#
"""

# ╔═╡ e2aff1dd-bc55-4247-9ef5-0d179c1a9870
md"""
- Array literals also accept a type specification before the `[]` brackets.
- So, if we want the same 2x2 array as before but now as floats, we can do so.
"""

# ╔═╡ a8741df0-a2e1-4e2e-adce-53519ae6838d
Float64[[1 2]
        [3 4]]

# ╔═╡ 715474da-85e8-4480-ba58-27bd88def3b8
md"""
#
"""

# ╔═╡ 565acb98-6298-41de-9db1-4a6941c3177e
md"""
- It also works for vect
"""

# ╔═╡ d0bf452e-92cc-4a60-a148-ad83460c8eb1
Bool[0, 1, 0, 1]

# ╔═╡ 3dcc34e1-e6eb-4d7f-a800-2fdebd6ba510
md"""
#
"""

# ╔═╡ 61ce12d0-9f61-4d9b-9120-b7142f5864f5
md"""
- You can even mix and match array literals with the constructors.
"""

# ╔═╡ 492f1dbe-b100-484a-8fd5-a0691b3b2a11
[ones(Int, 2, 2) zeros(Int, 2, 2)]

# ╔═╡ c1d27a68-cf2c-4cab-a582-b9615ca18ffd
[zeros(Int,2, 2)
   ones(Int,2,2)]

# ╔═╡ b75c1aa2-8d62-422e-b03a-a5ddcd26cd2c
md"""
#
"""

# ╔═╡ cc89b355-3f75-4267-86e0-b2c760719df2
md"""
- Another example.
"""

# ╔═╡ 8a0363e3-b6ab-4a6b-9813-a5bd646d4862
[ones(Int, 2, 2) [1; 2]
 [3 4] 5]

# ╔═╡ f677c208-a001-4d21-8991-d2af09628a6f
md"""
# Array Concatenation
"""

# ╔═╡ 2b4e44bd-d162-4c5a-99f0-bf495d15edaf
md"""
- Finally, we can also create arrays with concatenation functions.
- `cat`: concatenate input arrays along a specific dimension `dims`
"""

# ╔═╡ 635cb7dc-4d35-4160-87c3-c12a5266d2e4
cat(ones(2), zeros(2), dims=1)

# ╔═╡ cc4fd98f-6435-40f4-bbe6-da792a8e641c
cat(ones(2), zeros(2), dims=2)

# ╔═╡ 103bbcbd-c30d-45d4-972a-22931d82356b
md"""
#
"""

# ╔═╡ 53fa1274-229d-40af-a469-e7c19cf40425
md"""
- `vcat`: vertical concatenation, a shorthand for `cat(...; dims=1)`.
"""

# ╔═╡ 123674ab-7233-410b-ba2a-3feff99da66d
vcat(ones(2), zeros(2))

# ╔═╡ 1fbd4ffc-5aee-43b9-b4b7-205e4202b13f
md"""
- `hcat`: horizontal concatenation, a shorthand for `cat(...; dims=2)`.
"""

# ╔═╡ a159d681-a86a-45ff-8191-2e0447e54763
hcat(ones(2), zeros(2))

# ╔═╡ 343cff6e-7d4e-4ce5-bc01-a683681eb44b
md"""
# Array Inspection
"""

# ╔═╡ 7740c5cb-4523-41e1-b934-c73534ced614
md"""
- Once we have arrays, the next logical step is to inspect them.
- There are a lot of handy functions that allows the user to have an inner insight into any array.
- It is most useful to know what type of elements are inside an array.
- We can do this with `eltype`:
"""

# ╔═╡ 11789c5f-14e4-418b-9c48-457cb555577e
let 
	my_matrix_π = Matrix{Float64}(undef, 2, 2);
	fill!(my_matrix_π, 3.14)
	
	eltype(my_matrix_π)
end


# ╔═╡ 23aef7de-4ad3-4cd2-92d6-92f55d471116
md"""
#
"""

# ╔═╡ 3df473cc-3a0f-4dcc-a449-bfd19892f530
md"""
- `size` is a little tricky.
- By default it will return a `tuple` containing the array’s dimensions.
"""

# ╔═╡ 5cbad939-364c-4fe6-8bd5-f07952dc0901
let

	my_matrix_π = Matrix{Float64}(undef, 2, 2);
	fill!(my_matrix_π, 3.14)
	
	size(my_matrix_π)
	
end

# ╔═╡ 02acfe7a-b91a-4a2e-a6e9-8e6c3bb71dde
md"""
#
"""

# ╔═╡ 8069405a-4d69-460b-a569-42e66b3cda37
md"""
- You can get a specific dimension with a second argument to size
"""

# ╔═╡ a2e49d7a-904b-44c0-a4b5-822e16ec9dab
let

	my_matrix_π = Matrix{Float64}(undef, 2, 2);
	fill!(my_matrix_π, 3.14)
	
	size(my_matrix_π, 2)
	
end


# ╔═╡ 2a245bde-2f26-4611-8faf-5f88fe9d9dbb
md"""
# Array Indexing and Slicing
"""

# ╔═╡ 589f664c-02ff-412a-838f-8e6b3df6ce05
md"""
- Sometimes we want to only inspect certain parts of an array.
- This is called indexing and slicing.
- If you want a particular observation of a vector, or a row or column of a matrix; you’ll probably need to index an array.
- First, let’s create an example vector and matrix.
"""

# ╔═╡ 364d326c-c6d7-4160-b62d-c38f9ddf5355
md"""
#
"""

# ╔═╡ b64631c0-9cec-4db4-a4b7-9e05cab1e1bf
my_example_vector = [1, 2, 3, 4, 5]

# ╔═╡ 326c4fe6-27e1-4686-8668-ed5004a36fcc
my_example_matrix = [[1 2 3]
					 [4 5 6]
					 [7 8 9]]

# ╔═╡ 121f44c8-b81a-4b98-8b14-244636f25b42
md"""
#
"""

# ╔═╡ 1d951c8d-d097-4dc2-b3a6-57de39d009c1
md"""
!!! attention
    - Note that because we did not use a `let`-`end` block, `my_example_vector` and `my_example_matrix` can be accessed from all cells.
    - We do not have to define them again, but for this notebook we can only define them __once__.
"""

# ╔═╡ 996a86e9-fc64-47e6-b17d-c47637b4f37f
md"""
#
"""

# ╔═╡ 175e936c-089b-447f-8a32-a4e050edd0ad
md"""
- Let’s see first an example with vectors.
- Suppose you want the second element of a vector.
- You append `[]` brackets with the desired index inside.
"""

# ╔═╡ eda6d22e-06ed-4bbc-81cf-84c92cb007b3
my_example_vector[2]

# ╔═╡ efb24862-cc37-4441-8c53-6c9743cd99a7
md"""
#
"""

# ╔═╡ 8677fc85-1733-4db9-98c6-46e534ac0222
md"""
- The same syntax follows with matrices.
- But, since matrices are 2-dimensional arrays, we have to specify both rows and columns.
-  Let’s retrieve the element from the second row (first dimension) and first column (second dimension).
"""

# ╔═╡ 7705e84f-4f52-4316-a630-36c3e904651f
my_example_matrix[2, 1]

# ╔═╡ 146caa7b-49fa-4898-a44b-ecf1c0556f25
md"""
#
"""

# ╔═╡ 0d0c4ee1-10ff-424f-a501-8dbf2608879f
md"""
- Julia also have conventional keywords for the first and last elements of an array: `begin` and `end`.
- For example, the second to last element of a vector can be retrieved as.
"""

# ╔═╡ b0052499-31cd-40a1-9784-9bd146ecb886
my_example_vector[end-1]

# ╔═╡ c48cc1e5-a680-44f0-ab4b-b6bf8453ba5a
md"""
#
"""

# ╔═╡ 7b5759a8-d0b4-4a7b-bd84-6486e249a047
md"""
- It also works for matrices.
- Let’s retrieve the element of the last row and second column.
"""

# ╔═╡ 16d253ed-2bbc-4de1-88ed-244ba4543d00
my_example_matrix[end, begin+1]

# ╔═╡ 0815e314-b269-4efa-bc99-fdf33f9e4795
md"""
#
"""

# ╔═╡ 8367611f-e81e-4d68-8203-df970700afe4
md"""
- Often, we are not only interested in just one array element, but in a whole subset of array elements.
- We can accomplish this by slicing an array. 
- It uses the same index syntax, but with the added colon `:` to denote the boundaries that we are slicing through the array.
- For example, suppose we want to get the 2nd to 4th element of a vector: 
"""

# ╔═╡ ad5b63ad-6031-40f4-bc97-94a56b3a45bc
my_example_vector[2:4]

# ╔═╡ 539120ad-0e3f-4ddb-b92f-8eb93fe06863
md"""
#
"""

# ╔═╡ c55c8b22-c5cb-4af9-91da-1b5138c1681f
md"""
- We could do the same with matrices.
- Particularly with matrices if we want to select all elements in a following dimension we can do so with just a colon `:`.
- For example, all elements in the second row.
"""

# ╔═╡ e383bf0b-db35-4ff8-ac30-2aa48dd12819
my_example_matrix[2, :]

# ╔═╡ 7e24e8ba-792c-4926-a686-91114be1e6f5
md"""
#
"""

# ╔═╡ 69bc4ed8-11f2-4cbc-98aa-6ea5d4412274
md"""
- You can interpret this with something like "take 2nd row and all columns". 
- It also supports `begin` and `end`.
"""

# ╔═╡ b264aac2-5335-4cbb-a7b8-5889c40da920
my_example_matrix[begin+1:end, end]

# ╔═╡ 1d26ea5c-0fb5-41b4-b8d7-004f787a7a46
md"""
# Array Manipulation
"""

# ╔═╡ 9e0bad81-1e07-46c3-82fd-3b833f04ff67
md"""
- There are several ways we could manipulate an array.
- The first would be to manipulate a _single element_ of the array.
- We just index the array by the element and proceed with an assignment =
"""

# ╔═╡ df7654f1-ad75-4777-9f3b-47fd002b180d
md"""
#
"""

# ╔═╡ 72f13583-b7a8-496e-875c-62ee21e38330
my_example_matrix[2, 2] = 42

# ╔═╡ 70884b55-e20e-4318-8bc4-d86a8c2360a3
my_example_matrix

# ╔═╡ a18f832a-82be-4bbe-a128-3ed29cd868f9
md"""
#
"""

# ╔═╡ fcb1f99a-ce24-4c58-8962-ee701a3a62f9
md"""
- Or you can manipulate a certain subset of elements of the array.
- In this case, we need to slice the array and then assign with `=`.
"""

# ╔═╡ 716be2d5-397f-4ad7-bbcf-4965fc9471cc
my_example_matrix[3, :] = [17, 16, 15]

# ╔═╡ 88c489c8-01d8-4627-8408-852769d0a7bc
my_example_matrix

# ╔═╡ 7a072a96-3ab4-4789-b484-39fb1479eff2
md"""
#
"""

# ╔═╡ 31c2c3d6-71c2-44b9-9f35-08555e403f6f
md"""
- Note that we had to assign a vector because our sliced array is of type `Vector`.
"""

# ╔═╡ 707dc086-5e28-45a5-b1f4-81236213ef6b
typeof(my_example_matrix[3, :])

# ╔═╡ 7d2d869b-a277-4df4-88b8-e950dd4dea5d
md"""
#
"""

# ╔═╡ 47cf947e-5fdd-42c4-89f8-49e30777277f
md"""
- The second way we could manipulate an array is to alter its shape. 
- Suppose you have a 6-element vector and you want to make it a 3x2 matrix.
- You can do so with reshape, by using the array as first argument and a tuple of dimensions as second argument.
"""

# ╔═╡ 3165edf3-c58d-45b6-ac5a-b20165e68ff5
let
	six_vector = [1, 2, 3, 4, 5, 6];
	tree_two_matrix = reshape(six_vector, (3, 2))
end

# ╔═╡ 408a59f5-c0e9-4bd2-9fe4-3c1a54bb7cd9
md"""
#
"""

# ╔═╡ 47a245c6-c39a-4e17-9484-aa13d9d2d998
md"""
- You can do the reverse, convert it back to a vector, by specifying a tuple with only one dimension as second argument.
"""

# ╔═╡ 809d848b-8ee3-4a8c-abdd-7e1d863e0260
let
	six_vector = [1, 2, 3, 4, 5, 6];
	tree_two_matrix = reshape(six_vector, (3, 2))
	
	reshape(tree_two_matrix, (6, ))
end

# ╔═╡ 73989cbd-10c0-4b7e-94fc-59315ead56fd
md"""
#
"""

# ╔═╡ 8924cea3-e558-4ecc-8181-148f70a216a3
md"""
- The third way we could manipulate an array is to apply a function over every array element.
- This is where the familiar broadcasting "dot" operator `.` comes in.
"""

# ╔═╡ 7bd7abab-b16d-4017-80e9-cd0e9c714a07
log.(my_example_matrix)

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
	<input type="checkbox" value="" checked> Array, Vector
	<br>
	<input type="checkbox" value="" checked> Array Inspection
	<br>
	<input type="checkbox" value="" checked> Concatenation
	<br>
	<input type="checkbox" value="" checked> Indexing, Slicing
	<br>
	<input type="checkbox" value="" checked> Array Manipulation
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
# ╟─3b735bec-07fe-42cc-903f-7be58c7d0b5c
# ╟─a80e0671-4028-4c13-9245-ed2833b14507
# ╟─726fb7b2-fd76-4a5f-8df3-219ac81128a1
# ╟─71a59a18-3d2f-4eec-8da0-3ca22c422c69
# ╟─4bcf1a6e-3931-4124-b069-aec95d555ffb
# ╟─1839b7b9-8070-4605-929d-a5bbebb586be
# ╠═b2a58ad4-025a-4e76-8622-9eff84867fd8
# ╟─84c3bb84-62c1-4062-89b0-c3958c00dfc7
# ╟─933cd76a-992c-4279-b7b9-bb1aaa8c643d
# ╠═27643565-c0de-452a-a54b-fa769a4fb599
# ╟─556e7453-e960-44cc-97d1-1d9e52054e9a
# ╟─51b7e526-114d-4c59-887f-293cee6ac1e6
# ╠═41916a78-dd3d-481c-9eaf-e6e59ce62b7c
# ╟─de07142f-c954-4e7c-8311-bb14c1f19f6a
# ╠═760f526d-231b-411e-ba54-4af6a7ff6128
# ╟─29084f06-4c3c-43f0-abdd-6e0019ca62d6
# ╟─9115d5f2-51d1-436a-b537-fc6a9ce0f29e
# ╠═8861dedb-facc-42c6-87ab-42a623f2e0f5
# ╠═e0d056a3-ded8-4ee9-b538-d8333290c2de
# ╟─ebfcfe2b-a754-4102-a57d-d4201f1c533c
# ╟─02ae1f16-2fab-46da-a8d1-0b2352f63741
# ╠═0e651f7a-23fc-47ed-a669-fa057dd550d6
# ╟─8460e092-cb1f-4695-8a27-f405af12ef97
# ╟─e6c3b951-c354-41ab-bac8-ab1d8ebb675b
# ╠═1d9439b4-81fe-4301-8d44-704fbbb7a3fb
# ╟─dc687845-dde8-4fec-9a15-ad72eaf00dc9
# ╟─e2aff1dd-bc55-4247-9ef5-0d179c1a9870
# ╠═a8741df0-a2e1-4e2e-adce-53519ae6838d
# ╟─715474da-85e8-4480-ba58-27bd88def3b8
# ╟─565acb98-6298-41de-9db1-4a6941c3177e
# ╠═d0bf452e-92cc-4a60-a148-ad83460c8eb1
# ╟─3dcc34e1-e6eb-4d7f-a800-2fdebd6ba510
# ╟─61ce12d0-9f61-4d9b-9120-b7142f5864f5
# ╠═492f1dbe-b100-484a-8fd5-a0691b3b2a11
# ╠═c1d27a68-cf2c-4cab-a582-b9615ca18ffd
# ╟─b75c1aa2-8d62-422e-b03a-a5ddcd26cd2c
# ╟─cc89b355-3f75-4267-86e0-b2c760719df2
# ╠═8a0363e3-b6ab-4a6b-9813-a5bd646d4862
# ╟─f677c208-a001-4d21-8991-d2af09628a6f
# ╟─2b4e44bd-d162-4c5a-99f0-bf495d15edaf
# ╠═635cb7dc-4d35-4160-87c3-c12a5266d2e4
# ╠═cc4fd98f-6435-40f4-bbe6-da792a8e641c
# ╟─103bbcbd-c30d-45d4-972a-22931d82356b
# ╟─53fa1274-229d-40af-a469-e7c19cf40425
# ╠═123674ab-7233-410b-ba2a-3feff99da66d
# ╟─1fbd4ffc-5aee-43b9-b4b7-205e4202b13f
# ╠═a159d681-a86a-45ff-8191-2e0447e54763
# ╟─343cff6e-7d4e-4ce5-bc01-a683681eb44b
# ╟─7740c5cb-4523-41e1-b934-c73534ced614
# ╠═11789c5f-14e4-418b-9c48-457cb555577e
# ╟─23aef7de-4ad3-4cd2-92d6-92f55d471116
# ╟─3df473cc-3a0f-4dcc-a449-bfd19892f530
# ╠═5cbad939-364c-4fe6-8bd5-f07952dc0901
# ╟─02acfe7a-b91a-4a2e-a6e9-8e6c3bb71dde
# ╟─8069405a-4d69-460b-a569-42e66b3cda37
# ╠═a2e49d7a-904b-44c0-a4b5-822e16ec9dab
# ╟─2a245bde-2f26-4611-8faf-5f88fe9d9dbb
# ╟─589f664c-02ff-412a-838f-8e6b3df6ce05
# ╟─364d326c-c6d7-4160-b62d-c38f9ddf5355
# ╠═b64631c0-9cec-4db4-a4b7-9e05cab1e1bf
# ╠═326c4fe6-27e1-4686-8668-ed5004a36fcc
# ╟─121f44c8-b81a-4b98-8b14-244636f25b42
# ╟─1d951c8d-d097-4dc2-b3a6-57de39d009c1
# ╟─996a86e9-fc64-47e6-b17d-c47637b4f37f
# ╟─175e936c-089b-447f-8a32-a4e050edd0ad
# ╠═eda6d22e-06ed-4bbc-81cf-84c92cb007b3
# ╟─efb24862-cc37-4441-8c53-6c9743cd99a7
# ╟─8677fc85-1733-4db9-98c6-46e534ac0222
# ╠═7705e84f-4f52-4316-a630-36c3e904651f
# ╟─146caa7b-49fa-4898-a44b-ecf1c0556f25
# ╟─0d0c4ee1-10ff-424f-a501-8dbf2608879f
# ╠═b0052499-31cd-40a1-9784-9bd146ecb886
# ╟─c48cc1e5-a680-44f0-ab4b-b6bf8453ba5a
# ╟─7b5759a8-d0b4-4a7b-bd84-6486e249a047
# ╠═16d253ed-2bbc-4de1-88ed-244ba4543d00
# ╟─0815e314-b269-4efa-bc99-fdf33f9e4795
# ╟─8367611f-e81e-4d68-8203-df970700afe4
# ╠═ad5b63ad-6031-40f4-bc97-94a56b3a45bc
# ╟─539120ad-0e3f-4ddb-b92f-8eb93fe06863
# ╟─c55c8b22-c5cb-4af9-91da-1b5138c1681f
# ╠═e383bf0b-db35-4ff8-ac30-2aa48dd12819
# ╟─7e24e8ba-792c-4926-a686-91114be1e6f5
# ╟─69bc4ed8-11f2-4cbc-98aa-6ea5d4412274
# ╠═b264aac2-5335-4cbb-a7b8-5889c40da920
# ╟─1d26ea5c-0fb5-41b4-b8d7-004f787a7a46
# ╟─9e0bad81-1e07-46c3-82fd-3b833f04ff67
# ╟─df7654f1-ad75-4777-9f3b-47fd002b180d
# ╠═72f13583-b7a8-496e-875c-62ee21e38330
# ╠═70884b55-e20e-4318-8bc4-d86a8c2360a3
# ╟─a18f832a-82be-4bbe-a128-3ed29cd868f9
# ╟─fcb1f99a-ce24-4c58-8962-ee701a3a62f9
# ╠═716be2d5-397f-4ad7-bbcf-4965fc9471cc
# ╠═88c489c8-01d8-4627-8408-852769d0a7bc
# ╟─7a072a96-3ab4-4789-b484-39fb1479eff2
# ╟─31c2c3d6-71c2-44b9-9f35-08555e403f6f
# ╠═707dc086-5e28-45a5-b1f4-81236213ef6b
# ╟─7d2d869b-a277-4df4-88b8-e950dd4dea5d
# ╟─47cf947e-5fdd-42c4-89f8-49e30777277f
# ╠═3165edf3-c58d-45b6-ac5a-b20165e68ff5
# ╟─408a59f5-c0e9-4bd2-9fe4-3c1a54bb7cd9
# ╟─47a245c6-c39a-4e17-9484-aa13d9d2d998
# ╠═809d848b-8ee3-4a8c-abdd-7e1d863e0260
# ╟─73989cbd-10c0-4b7e-94fc-59315ead56fd
# ╟─8924cea3-e558-4ecc-8181-148f70a216a3
# ╠═7bd7abab-b16d-4017-80e9-cd0e9c714a07
# ╟─a124bf84-7ca4-40c8-8607-b05dec24a730
# ╟─75672e0c-5c34-44c8-b1a9-f6ba821d6c8d
# ╟─5f191192-bc5f-41e8-845c-beba89ee5841
# ╟─cddc45e1-7547-4d34-bc12-b08a5320a62c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
