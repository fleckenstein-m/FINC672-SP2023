### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ ab6ac8d0-6d8a-11ed-0400-1b357312718e
md"""
# FINC 672 - Julia Data Structures
"""

# ╔═╡ 42d2dc69-c5e8-4cb8-809b-19cae75e479d
begin
	html"""
	<fieldset>      
    <legend><b>Learning Objectives</b></legend>      
	<br>
	<input type="checkbox" value=""> Broadcasting Operators and Functions
	<br>
	<input type="checkbox" value=""> String
	<br>
	<input type="checkbox" value=""> Tuple, NamedTuple
	<br>
	<input type="checkbox" value=""> UnitRange
	<br>
	<input type="checkbox" value=""> Array, Vector
	<br>
	<input type="checkbox" value=""> Pair, Dict
	<br>
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

# ╔═╡ 3b735bec-07fe-42cc-903f-7be58c7d0b5c
md"""
# Arrays and Vectors
"""

# ╔═╡ a80e0671-4028-4c13-9245-ed2833b14507
md"""
- Arrays are a systematic arrangement of similar objects, usually in rows
and columns.
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
- ones for all elements being initialized to value one.
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
- Julia also have conventional keywords for the first and last elements of an array:
`begin` and `end`.
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

# ╔═╡ 3f510cf6-1412-493a-944a-ce6a97e10c58
md"""
- We can broadcast operators.
"""

# ╔═╡ 93ea5c80-8dc9-42f7-860a-09a797ae4047
my_example_matrix .+ 100

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


# ╔═╡ bc94035a-795b-4d08-aab2-87519b4ffd65
md"""
# Strings
"""

# ╔═╡ 25a404ef-b21a-4d43-b87b-f4348d9bb219
md"""
- Strings are represented delimited by double quotes.
"""

# ╔═╡ 6b387a90-454d-4507-8406-4acebdff8a3d
typeof("This is a string")

# ╔═╡ a0a9a625-5ac0-470b-8e00-f724064bcf97
md"""
#
"""

# ╔═╡ 4f5bb727-6475-483e-8d60-9cbeed9d7822
md"""
- We can also write a multiline string
"""

# ╔═╡ 402ebee0-68b0-4318-809d-fa81d40ff243
let 
	text = "
		This is a big multiline string.
		As you can see.
		It is still a String to Julia.
		"

	println(text)

end

# ╔═╡ 7aef4abc-0abd-4e51-8494-2805aac60869
md"""
#
"""

# ╔═╡ cdcd1a12-3beb-4080-b76c-1976a48c6500
md"""
- But, it is, typically, more clear to use triple quotation marks
"""

# ╔═╡ 34abd3a8-0a33-4d02-827e-d61c74ee9838
let
	s = """
		This is a big multiline string with a nested "quotation".
		As you can see.
		It is still a String to Julia.
		"""
	println(s)
	
end

# ╔═╡ 66d5ad2e-7569-4d40-9e1b-f49f7f2b1955
md"""
# String Concatenation
"""

# ╔═╡ 098eafb0-8c7e-4584-b252-512d0bbb0227
md"""
- A common string operation is string concatenation.
- Suppose that you want to construct a new string that is the concatenation of two or more strings.
- This is accomplished in julia either with the `*` operator or the join function.
"""

# ╔═╡ 52c10638-14d0-4812-b54d-5879198be7dc
let
	
	hello = "Hello"
	goodbye = "Goodbye"

	hello * goodbye

end

# ╔═╡ cad420df-583c-4cfe-94db-d01506374f9e
md"""
#
"""

# ╔═╡ 8b592c01-c988-4fb7-940e-a6628d35bceb
md"""
- As you can see, we are missing a space between hello and goodbye.
- We could concatenate an additional " " string with the *, but that would be cumbersome for more than two strings.
- That’s when the `join` function is useful.
- We just pass as arguments the strings inside the brackets `[]` and the separator.
"""

# ╔═╡ 7a9e7928-6d4e-40e8-b9ea-26e2eb6d3f61
let
	
	hello = "Hello"
	goodbye = "Goodbye"
	
	join([hello, goodbye], " ")

end

# ╔═╡ a7cf85d5-2299-4a6d-b2a0-9f70f1a5a96f
md"""
# String Interpolation
"""

# ╔═╡ 01a1c439-7022-4857-968a-5321df4a183e
md"""
- Concatenating Strings can be convoluted.
- We can be much more expressive with string interpolation.
- It works like this: you specify whatever you want to be included in your string with the dollar sign `$`.
- Here’s the example before but now using interpolation.
"""

# ╔═╡ c245716e-1a72-42e9-b8cc-fd65b785e968
let

	hello = "Hello"
	goodbye = "Goodbye"
	
	s = "$hello $goodbye"

end


# ╔═╡ 39a41ede-0750-471d-89b3-b2a2d4e2ce52
md"""
#
"""

# ╔═╡ 7868c045-4fd9-419d-bc66-a9d14ea41c97
md"""
- It works even inside functions. Let’s create a function to illustrate the idea.
"""

# ╔═╡ c955997d-eeb5-48c6-9ab5-c85de7bef6fc
function test_interpolated(a, b)
	if a < b
		"$a is less than $b"
	elseif a > b
		"$a is greater than $b"
	else
		"$a is equal to $b"
	end
end

# ╔═╡ c01f4006-98d1-48b8-a069-22f66b856c62
test_interpolated(3.14, 3.14)

# ╔═╡ 657a80f5-b889-4c2f-84d3-eebdd9f28f02
md"""
# String Manipulations
"""

# ╔═╡ 3c70b4ac-087e-41cf-a38a-fd654edb6011
md"""
- There are several functions to manipulate strings in Julia. 
- We will demonstrate the most common ones.
- Also, note that most of these functions accepts a Regular Expression (RegEx) as arguments.
- We won’t cover RegEx in this course, but you are encouraged to learn about them, especially if most of your work uses textual data.
- First, let us define a string for us to work with.
"""

# ╔═╡ 189e90ac-1516-4b4d-86c0-911bfbd1db24
julia_string = "Julia is an amazing opensource programming language"

# ╔═╡ 329b6035-dcd0-4238-b428-a8448141bdfa
md"""
#
"""

# ╔═╡ 0c7bf844-59c0-4893-9c5f-40774bb61309
md"""
- `occursin`, `startswith` and `endswith`: A conditional (returns either `true` or `false`) if the first argument is a
  - substring of the second argument
  - prefix of the second argument
  - suffix of the second argument
"""

# ╔═╡ c513d589-af7d-40d0-b496-0d0de4df56c3
md"""
#
"""

# ╔═╡ 4990d1a0-30f7-4643-bd6e-39d0a642baa0
occursin("Julia", julia_string)

# ╔═╡ e4e15f0f-212a-4071-b408-46dadc0b3e8d
startswith("Julia", julia_string)

# ╔═╡ 70054c25-f239-47e3-b5c8-30ecec5101ce
endswith("Julia", julia_string)

# ╔═╡ 5a019a2f-0a04-4c7e-855e-40c216de0fda
md"""
#
"""

# ╔═╡ 21c0603f-43e6-49ac-827e-6188b4bc52dc
md"""
- 2. `lowercase`, `uppercase`, `titlecase` and `lowercasefirst`.
"""

# ╔═╡ 77837a1d-16f7-4034-8c0e-6be4fc7f5b10
lowercase(julia_string)

# ╔═╡ f5b12fba-0525-4f19-9b69-f62fc7603e08
uppercase(julia_string)

# ╔═╡ 96802ee7-349f-4b2a-b7e5-0697b2537142
titlecase(julia_string)

# ╔═╡ 265a4519-24c1-49c3-af86-659e451473e9
lowercasefirst(julia_string)

# ╔═╡ 6a9fcae9-9fa8-4209-a735-90a092514067
md"""
#
"""

# ╔═╡ 4ae96703-9ea2-4edc-bd54-1cc86a55eabc
md"""
- `split`: breaks up a string by a delimiter.
"""

# ╔═╡ fa8f864a-862c-4b4c-b755-0a7e7530ccfa
split(julia_string, " ")

# ╔═╡ f70b6a6f-0704-4297-9913-f8328745d9ac
md"""
- `replace`: introduces a new syntax, called the `Pair`.
"""

# ╔═╡ d8d0ceda-a5c3-4c4a-819a-f2c513afe50a
replace(julia_string, "amazing" => "awesome")

# ╔═╡ e5eb8771-9fa4-4bca-bdfb-abb8b1af39d3
md"""
# Pairs
"""

# ╔═╡ 27b3ff56-2e40-4ba8-a366-9957bf711f88
md"""
- `Pair` is a data structure that holds two types.
- We construct a pair in Julia is using the following syntax.
"""

# ╔═╡ 1fa6ce25-d853-4110-b5f1-615773e0a12d
let
	my_pair = Pair("Julia", 42)
end

# ╔═╡ 4f03a603-145d-415e-97de-9f400c6480b5
md"""
#
"""

# ╔═╡ 79464896-4b6c-4aec-8680-b0d00c0fadc9
md"""
- Alternatively, we can create a pair by specifying both values and in between we
use the pair `=>` operator.
"""

# ╔═╡ 2eff919e-2f67-4b5d-8e51-1ca4ef2e52f8
my_pair = "Julia" => 42

# ╔═╡ 5347321b-0526-4cd9-b6c7-b2366407e9f8
md"""
#
"""

# ╔═╡ 3463b880-9a25-43fb-95f6-bd1aac9653f4
md"""
- The elements are stored in the fields first and second
"""

# ╔═╡ ad08de30-bc54-45c1-9456-86b46eeb4602
my_pair.first

# ╔═╡ c483a43e-7422-477e-91ce-1431f07b0a97
my_pair.second

# ╔═╡ 806c4f8f-c9fb-4920-9956-eb0e7ccf543f
md"""
# String Conversions
"""

# ╔═╡ 7e2502b8-4535-4242-b56d-2373cb0d4050
md"""
- Often, we need to convert between types in Julia.
- We can use the string function.
"""

# ╔═╡ d6a7a8f8-9bf3-4d09-a108-eddb57e2c8b2
let 
	my_number = 123

	typeof(string(my_number))
end

# ╔═╡ 050af10c-ba4f-422a-8aa3-8af49ca9048b
md"""
#
"""

# ╔═╡ ccc2b2e7-dbc1-4fbb-9620-951d0ff21a42
md"""
- Sometimes, we want the opposite: convert a string to a number.
- Julia has a handy function for that: `parse`.
"""

# ╔═╡ f1affb0e-c709-4d29-ab47-dbc017bc54c6
typeof(parse(Int64, "123"))

# ╔═╡ cb3c760e-16cf-4817-b8fc-bdab9f1b5e8b
md"""
#
"""

# ╔═╡ 392afdf7-68df-4227-87a0-22e88dfb3e75
md"""
- Sometimes, we want to play safe with these conversions.
- That’s when `tryparse` function steps in.
- It has the same functionality as parse but returns either a value of the requested type, or `nothing`.
- That makes `tryparse` handy when we want to avoid errors.
- Of course, you would need to deal with all those nothing values afterwards.
"""

# ╔═╡ dbcb6057-086d-4584-b961-7b6569781ffa
let
	a = tryparse(Int64, "A very non-numeric string")
	
	typeof(a)
end

# ╔═╡ e4e970b8-0bc0-4d84-a20c-171546784439
md"""
# Tuples
"""

# ╔═╡ a47c9bca-a192-4148-8968-b105243ff04b
md"""
- Julia has a data structure called `tuple`. They are really special in Julia because they are often used in relation to functions.
- A tuple is a fixed-length container that can hold multiple different types.
- A tuple is an __imutable__ object, meaning that it cannot be modified after instantiation.
- To construct a tuple, use parentheses `()` to delimitate the beginning and end, along with commas `,` as value’s delimiters.
"""

# ╔═╡ d1011108-e962-4421-bc98-28483f5f560d
md"""
#
"""

# ╔═╡ 4ad8f55a-b04c-4c98-9a91-ae7c380e5899
md"""
- Example
  - Here, we are creating a tuple with three values.
  - Each one of the values is a different type. We can access them via indexing.
"""

# ╔═╡ b7dd2983-7735-4c23-a54d-ac3aabdd0838
my_tuple = (1, 3.14, "Julia")

# ╔═╡ 892566de-1f1a-4745-8713-f0244131bc6a
my_tuple[2]

# ╔═╡ 361ef513-3661-4c9a-8630-4d1e42071efe
md"""
#
"""

# ╔═╡ 9363fe6a-de52-493f-8aef-a336d992077c
md"""
- We can also loop over tuples with the `for` keyword, and even apply functions to tuples. 
- But we can never change any value of a tuple since they are immutable.
"""

# ╔═╡ 6723daf1-0924-43c9-97df-a230d36029be
md"""
#
"""

# ╔═╡ cee8a83c-1fc3-43fd-928f-c69ee25afba9
md"""
- Example
  - Recall that functions can return multiple values.
  - Let’s inspect what our `add_multiply` function returns.
"""

# ╔═╡ 41b9fa87-6a60-4896-b09e-0fe16947c5da
function add_multiply(x, y)
	addition = x + y
	multiplication = x * y
	
	return addition, multiplication
end

# ╔═╡ 8f3a92ba-577b-406e-8200-be64dddd0bc8
let 
	return_multiple = add_multiply(1, 2)
	
	typeof(return_multiple)
end

# ╔═╡ 2fc75d57-30e8-4c28-860c-386649436615
md"""
#
"""

# ╔═╡ 95ce5454-a3a3-430a-9bc5-74fe3b5dd48f
md"""
- One more thing about `Tuples`.
- When you want to pass more than one variable to an anonymous function, what would you need to use?
- Answer: Tuples
"""

# ╔═╡ 6796d442-ea72-4297-bad1-2b18e90d0d9a
map((x, y) -> x^y, 2, 3)

# ╔═╡ 3c03eee2-47c3-432a-8e21-783422e18c89
md"""
- Or, even more than two arguments.
"""

# ╔═╡ f5549c83-545a-4da2-841a-aaf1a2c656f3
map((x, y, z) -> x^y + z, 2, 3, 1)

# ╔═╡ fff54865-2dd3-4997-b3eb-6381fcb15450
md"""
# Named Tuples
"""

# ╔═╡ d8612c9b-aa37-4eb2-a853-493d5c68dd34
md"""
- Sometimes, you want to name the values in tuples. That’s when __named tuples__ come in.
- Their functionality is pretty much same the same as tuples. they are immutable and can hold any type of value. 
- Named tuple’s construction are slightly different from tuples. 
- You have the familiar parentheses `()` and comma `,` value separator. But now you name the values.
"""

# ╔═╡ 77ba073b-e243-4f8e-827b-08f95e6981d1
my_namedtuple = (i=1, f=3.14, s="Julia")

# ╔═╡ a02207c9-5108-4435-8b7a-9b68ef5bb97c
md"""
#
"""

# ╔═╡ d9ed75c6-0216-4552-8a5e-b917757cc48a
md"""
- We can access a named tuple’s values via indexing like regular tuples or, alternatively, access by their names with `.`
"""

# ╔═╡ 1465ebe6-965b-45ab-8f14-2f5e341c3928
my_namedtuple.s

# ╔═╡ 4152dd29-da41-4f77-8991-459690a85b5b
md"""
#
"""

# ╔═╡ f84125f9-5eed-48d1-aace-18100c57f2af
md"""
- Often Julia users create a named tuple by using the familiar parenthesis `()` and commas `,`, but without naming the values.
- To do so you begin the named tuple construction by specifying first a semicolon `;` before the values.
- This is especially useful when the values that would compose the named tuple are already defined in variables or when you want to avoid long lines
"""

# ╔═╡ 19f0e235-8302-4659-bc1f-565574449a62
let

	i = 1
	f = 3.14
	s = "Julia"

	my_quick_namedtuple = (; i, f, s)
	
end

# ╔═╡ 3cf6bb82-151b-4082-9ff9-67506b74af59
md"""
# Ranges
"""

# ╔═╡ 37aee362-f7f6-4fd7-b240-e2c6da0252cd
md"""
- A range in Julia represents an interval between a start and stop boundaries.
- The syntax is `start:stop`.
"""

# ╔═╡ 07f2c7a2-4262-4f6d-bed1-171124dbd28f
1:10

# ╔═╡ efd520b0-5890-4de4-adbc-e15664b94688
typeof(1:10)

# ╔═╡ 7b21ac8e-b41c-47d0-9a69-1ddfeed7da42
md"""
- As you can see, our instantiated range is of type `UnitRange{T}` where `T` is the type inside the UnitRange (`Int64` in this case).
"""

# ╔═╡ a323ff01-48f8-4e80-ac10-6b3e5a6204bc
md"""
#
"""

# ╔═╡ 78c5b679-3707-427c-b8c2-103e8b58491c
md"""
- And, if we _gather_ all the values, we get
"""

# ╔═╡ acdc6195-bddb-482d-8669-d574afa653e8
[x for x in 1:10]

# ╔═╡ e90df9cb-54eb-456a-ac4e-a374d2eb3ba1
md"""
- A convenient shortcut is the `collect` function.
"""

# ╔═╡ 47442c7b-9c18-4e8b-96fd-0b4f472c8624
collect(1:10)

# ╔═╡ 6fdf0cc0-82ae-4dea-83f4-6da843962f4a
md"""
#
"""

# ╔═╡ bf7c9958-7100-4b32-8a45-100fe07b85b2
md"""
- We can construct ranges also for other types.
"""

# ╔═╡ 12ab5565-b56a-4fd1-8a96-cb195093570f
typeof(1.0:10.0)

# ╔═╡ 2e44fbb1-3b01-442b-9165-33a27f89f7e8
md"""
#
"""

# ╔═╡ 2830ac94-b7a3-48fe-9865-aa3bd1293ecc
md"""
- Sometimes, we want to change the default interval _stepsize_ behavior.
- We can do that by adding a _stepsize_ in the range syntax `start:step:stop`.
- For example, suppose we want a range of `Float64` from 0 to 1 with steps of size 0.2.
"""

# ╔═╡ 42442364-0013-487e-b80d-47ab051f0c1b
0.0:0.2:1.0

# ╔═╡ 35678f86-dff3-4baf-ac61-22eb2aff248d
md"""
#
"""

# ╔═╡ cb5b2fe7-63aa-4fe3-a32a-e2caf6078668
md"""
- Again, we can _materialize_ a `UnitRange` into a collection by using the function `collect`.
- We have an array of the type specified in the UnitRange between the boundaries that we’ve set.
"""

# ╔═╡ 8bee3b15-811d-4c3e-9266-a023c5211eae
collect(0.0:0.2:1.0)

# ╔═╡ 7cc28408-ca76-4054-bee3-47c6553b4dd2
md"""
# Dictionaries (Dicts)
"""

# ╔═╡ ba22b383-ee9e-4ff7-a9ce-ebac8b64fdc5
md"""
- `Dict` in Julia is just a _hash table_ with pairs of `key` and `value`.
- `keys` and `values` can be of any type, but generally you’ll see keys as `strings`.
- There are two ways to construct `Dicts` in Julia.
- The first is using the default constructor `Dict` and passing a vector of tuples composed of `(key, value)`.
"""

# ╔═╡ 16a868cd-84b1-419e-b43f-589daaac3dc7
# ╠═╡ disabled = true
#=╠═╡
let
	
	my_dict = Dict([("one", 1), ("two", 2)])
	
end
  ╠═╡ =#

# ╔═╡ baf9f998-d3ba-4b7f-a618-baf7d01ba8eb
md"""
#
"""

# ╔═╡ 206882f8-0bd4-434d-a821-7775d5a60e98
md"""
- The second way of constructing Dicts is more elegant because it has a more expressive syntax.
- You use the same default constructor Dict, but now you pass pairs of `key` and `value`.
"""

# ╔═╡ 2edcb5a2-39fb-4363-a303-52ed32870291
let 
	
	my_dict = Dict("one" => 1, "two" => 2)
	
end

# ╔═╡ 28ce123b-8a31-42c1-9e17-836b3a60513e
md"""
#
"""

# ╔═╡ 4db895f3-712c-4ff7-b679-caf70572cae9
md"""
- You can retrieve a Dicts value by indexing it by the corresponding key.
"""

# ╔═╡ af2589e3-c191-4f93-9150-295914c85c33
let
	
	my_dict = Dict("one" => 1, "two" => 2)
	
	my_dict["one"]
	
end

# ╔═╡ 491ff53c-59b5-49dd-bf12-69d3e1e1e674
md"""
- Similarly, to add a new entry you index the `Dict` by the desired `key` and assign a value with the assignment `=` operator.
"""

# ╔═╡ bfa4eb7f-6aef-4723-9565-dcb2131223c9
let

	my_dict = Dict("one" => 1, "two" => 2)
	
	my_dict["three"] = 3

end

# ╔═╡ 30f2ae99-cb6d-4ac8-9ef3-154ca18ded3f
md"""
#
"""

# ╔═╡ 58a811eb-97bc-4173-a3b0-6ffdf148d798
md"""
- If you want to check if a Dict has a certain `key` you can use the `haskey` function.
"""

# ╔═╡ c636919c-76d1-4b89-a59b-a3c6c0f5a495
let
	my_dict = Dict("one" => 1, "two" => 2)
	
	haskey(my_dict, "two")
	
end

# ╔═╡ 5392ee59-5a03-4789-a64e-2c661f250107
md"""
#
"""

# ╔═╡ 7ec0aa0d-153e-4cef-a2d3-40af83928e95
md"""
- To delete a key you can use either the `delete!` function.
"""

# ╔═╡ e93c8fab-b86f-4f75-961e-da53c6f1ab6a
let
	my_dict = Dict("one" => 1, "two" => 2)
	my_dict["three"] = 3
	
	delete!(my_dict, "three")
end

# ╔═╡ 70d5f5eb-2544-41a9-9faf-8fe5bd6d20c2
md"""
#
"""

# ╔═╡ cda7feb9-f18b-4490-9f3d-3b726981e4df
md"""
- Or to delete a `key` while retuning its value you can use the `pop!` function.
"""

# ╔═╡ 1faa48df-32e8-42f3-be0d-554257b948bb
let

	my_dict = Dict("one" => 1, "two" => 2)

	popped_value = pop!(my_dict, "two")
	
end

# ╔═╡ c135fa18-56ff-4e10-b59c-d34371da20c7
md"""
#
"""

# ╔═╡ eec76302-4b16-451d-9a0a-ab504f33dfe3
md"""
- There is one useful `Dict` constructor that we use a lot.
- Suppose you have two vectors and you want to construct a Dict with one of them as keys and the other as values.
- You can do that with the `zip` function which _glues_ together two objects just like a _zipper_.
"""

# ╔═╡ b3dbf318-6e52-46ac-ae6e-2ea8832ba9e1
md"""
#
"""

# ╔═╡ 3ee268a0-f32b-4c99-8da8-fc5dbff7db08
begin
	A = ["one", "two", "three"];
	B = [1, 2, 3];

	dic = Dict(zip(A, B))
end

# ╔═╡ 2dea6272-e8de-4c4c-9bb5-136c42d0554d
md"""
- For instance, we can now get the number 3 via.
"""

# ╔═╡ 1a9b63d3-953e-42f2-9557-93fb9c234b02
dic["three"]

# ╔═╡ f2012a77-742e-49ed-b9df-d3c70519e8e0
md"""
# Splat Operator
"""

# ╔═╡ 56cd4d6f-733d-464a-a02d-8455a977cf53
md"""
- In Julia we have the _splat_ operator `...` which is mainly used in function calls as a sequence of arguments.
- The most intuitive way to learn about splatting is with an example.
- The `add_elements` function below takes three arguments to be added together.
"""

# ╔═╡ 371d8b82-0bcf-4071-81cc-a855e6944078
add_elements(a, b, c) = a + b + c

# ╔═╡ 83f142a0-104b-4978-acf0-9438d9913ffb
md"""
#
"""

# ╔═╡ 55c08ffe-6ccb-4567-b127-20978b7676a8
md"""
- Now suppose that we have a collection with three elements.
- The naïve way to do this would be to supply the function with all three elements as function arguments like this.
"""

# ╔═╡ 135adc8e-4169-4800-943a-fe51828fad16
let
	my_collection = [1, 2, 3]
	
	add_elements(my_collection[1], my_collection[2], my_collection[3])
	
end

# ╔═╡ fc45db58-1856-45ef-a633-9096fd3940b9
md"""
#
"""

# ╔═╡ 0c8b1e06-3f4d-42e0-a9e8-f69979ffa7dd
md"""
- Here is where we use the `splat` operator `...` which takes a collection (often an array, vector, tuple or range) and converts into a sequence of arguments.
"""

# ╔═╡ 5a4a22ad-cf6e-4f1e-8ca4-aedb41f5076f
let
	my_collection = [1, 2, 3]
	
	add_elements(my_collection...)
end

# ╔═╡ c91592c2-6bf2-4fbc-bbd4-c4703e32f1e6
md"""
#
"""

# ╔═╡ 36cc5182-061d-45e9-8bca-f704e1be324d
md"""
- The `...` is included after the collection that we want to _splat_ into a sequence of arguments.
- In the example above, syntactically speaking, the following are the same.
```
	collection = [x, y, z]
	function(collection...) = function(x, y, z)
```
"""

# ╔═╡ 391cbe17-ce70-48aa-8de9-3a0aa0b6d9fb
md"""
#
"""

# ╔═╡ 9472bd3a-6805-41bf-9778-eca308a39696
md"""
- Anytime Julia sees a splatting operator inside a function call, it will be converted on a sequence of arguments for all elements of the collection separated by commas.
- It also works for ranges
"""

# ╔═╡ 95aa5f25-c707-4031-8ab0-e1d4264b07f7
add_elements(1:3...)

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
	<input type="checkbox" value="" checked> String
	<br>
	<input type="checkbox" value="" checked> Tuple, NamedTuple
	<br>
	<input type="checkbox" value="" checked> UnitRange
	<br>
	<input type="checkbox" value="" checked> Array, Vector
	<br>
	<input type="checkbox" value="" checked> Pair, Dict
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
# ╠═ab6ac8d0-6d8a-11ed-0400-1b357312718e
# ╠═42d2dc69-c5e8-4cb8-809b-19cae75e479d
# ╟─3e72d672-8f55-4958-af43-6a43c3bbf830
# ╟─15965456-03b5-41fc-bd5a-e0334f2e48f1
# ╠═3b735bec-07fe-42cc-903f-7be58c7d0b5c
# ╠═a80e0671-4028-4c13-9245-ed2833b14507
# ╠═726fb7b2-fd76-4a5f-8df3-219ac81128a1
# ╠═71a59a18-3d2f-4eec-8da0-3ca22c422c69
# ╠═4bcf1a6e-3931-4124-b069-aec95d555ffb
# ╠═1839b7b9-8070-4605-929d-a5bbebb586be
# ╠═b2a58ad4-025a-4e76-8622-9eff84867fd8
# ╠═84c3bb84-62c1-4062-89b0-c3958c00dfc7
# ╠═933cd76a-992c-4279-b7b9-bb1aaa8c643d
# ╠═27643565-c0de-452a-a54b-fa769a4fb599
# ╠═556e7453-e960-44cc-97d1-1d9e52054e9a
# ╠═51b7e526-114d-4c59-887f-293cee6ac1e6
# ╠═41916a78-dd3d-481c-9eaf-e6e59ce62b7c
# ╠═760f526d-231b-411e-ba54-4af6a7ff6128
# ╠═29084f06-4c3c-43f0-abdd-6e0019ca62d6
# ╠═9115d5f2-51d1-436a-b537-fc6a9ce0f29e
# ╠═8861dedb-facc-42c6-87ab-42a623f2e0f5
# ╠═e0d056a3-ded8-4ee9-b538-d8333290c2de
# ╠═ebfcfe2b-a754-4102-a57d-d4201f1c533c
# ╠═02ae1f16-2fab-46da-a8d1-0b2352f63741
# ╠═0e651f7a-23fc-47ed-a669-fa057dd550d6
# ╠═8460e092-cb1f-4695-8a27-f405af12ef97
# ╠═e6c3b951-c354-41ab-bac8-ab1d8ebb675b
# ╠═1d9439b4-81fe-4301-8d44-704fbbb7a3fb
# ╠═dc687845-dde8-4fec-9a15-ad72eaf00dc9
# ╠═e2aff1dd-bc55-4247-9ef5-0d179c1a9870
# ╠═a8741df0-a2e1-4e2e-adce-53519ae6838d
# ╠═565acb98-6298-41de-9db1-4a6941c3177e
# ╠═d0bf452e-92cc-4a60-a148-ad83460c8eb1
# ╠═3dcc34e1-e6eb-4d7f-a800-2fdebd6ba510
# ╠═61ce12d0-9f61-4d9b-9120-b7142f5864f5
# ╠═492f1dbe-b100-484a-8fd5-a0691b3b2a11
# ╠═c1d27a68-cf2c-4cab-a582-b9615ca18ffd
# ╠═8a0363e3-b6ab-4a6b-9813-a5bd646d4862
# ╠═f677c208-a001-4d21-8991-d2af09628a6f
# ╠═2b4e44bd-d162-4c5a-99f0-bf495d15edaf
# ╠═635cb7dc-4d35-4160-87c3-c12a5266d2e4
# ╠═cc4fd98f-6435-40f4-bbe6-da792a8e641c
# ╠═103bbcbd-c30d-45d4-972a-22931d82356b
# ╠═53fa1274-229d-40af-a469-e7c19cf40425
# ╠═123674ab-7233-410b-ba2a-3feff99da66d
# ╠═1fbd4ffc-5aee-43b9-b4b7-205e4202b13f
# ╠═a159d681-a86a-45ff-8191-2e0447e54763
# ╠═343cff6e-7d4e-4ce5-bc01-a683681eb44b
# ╠═7740c5cb-4523-41e1-b934-c73534ced614
# ╠═11789c5f-14e4-418b-9c48-457cb555577e
# ╠═23aef7de-4ad3-4cd2-92d6-92f55d471116
# ╠═3df473cc-3a0f-4dcc-a449-bfd19892f530
# ╠═5cbad939-364c-4fe6-8bd5-f07952dc0901
# ╠═8069405a-4d69-460b-a569-42e66b3cda37
# ╠═a2e49d7a-904b-44c0-a4b5-822e16ec9dab
# ╠═2a245bde-2f26-4611-8faf-5f88fe9d9dbb
# ╠═589f664c-02ff-412a-838f-8e6b3df6ce05
# ╠═364d326c-c6d7-4160-b62d-c38f9ddf5355
# ╠═b64631c0-9cec-4db4-a4b7-9e05cab1e1bf
# ╠═326c4fe6-27e1-4686-8668-ed5004a36fcc
# ╠═1d951c8d-d097-4dc2-b3a6-57de39d009c1
# ╠═996a86e9-fc64-47e6-b17d-c47637b4f37f
# ╠═175e936c-089b-447f-8a32-a4e050edd0ad
# ╠═eda6d22e-06ed-4bbc-81cf-84c92cb007b3
# ╠═efb24862-cc37-4441-8c53-6c9743cd99a7
# ╠═8677fc85-1733-4db9-98c6-46e534ac0222
# ╠═7705e84f-4f52-4316-a630-36c3e904651f
# ╠═146caa7b-49fa-4898-a44b-ecf1c0556f25
# ╠═0d0c4ee1-10ff-424f-a501-8dbf2608879f
# ╠═b0052499-31cd-40a1-9784-9bd146ecb886
# ╠═c48cc1e5-a680-44f0-ab4b-b6bf8453ba5a
# ╠═7b5759a8-d0b4-4a7b-bd84-6486e249a047
# ╠═16d253ed-2bbc-4de1-88ed-244ba4543d00
# ╠═8367611f-e81e-4d68-8203-df970700afe4
# ╠═ad5b63ad-6031-40f4-bc97-94a56b3a45bc
# ╠═539120ad-0e3f-4ddb-b92f-8eb93fe06863
# ╠═c55c8b22-c5cb-4af9-91da-1b5138c1681f
# ╠═e383bf0b-db35-4ff8-ac30-2aa48dd12819
# ╠═7e24e8ba-792c-4926-a686-91114be1e6f5
# ╠═69bc4ed8-11f2-4cbc-98aa-6ea5d4412274
# ╠═b264aac2-5335-4cbb-a7b8-5889c40da920
# ╠═1d26ea5c-0fb5-41b4-b8d7-004f787a7a46
# ╠═9e0bad81-1e07-46c3-82fd-3b833f04ff67
# ╠═72f13583-b7a8-496e-875c-62ee21e38330
# ╠═70884b55-e20e-4318-8bc4-d86a8c2360a3
# ╠═a18f832a-82be-4bbe-a128-3ed29cd868f9
# ╠═fcb1f99a-ce24-4c58-8962-ee701a3a62f9
# ╠═716be2d5-397f-4ad7-bbcf-4965fc9471cc
# ╠═88c489c8-01d8-4627-8408-852769d0a7bc
# ╠═7a072a96-3ab4-4789-b484-39fb1479eff2
# ╠═31c2c3d6-71c2-44b9-9f35-08555e403f6f
# ╠═707dc086-5e28-45a5-b1f4-81236213ef6b
# ╠═47cf947e-5fdd-42c4-89f8-49e30777277f
# ╠═3165edf3-c58d-45b6-ac5a-b20165e68ff5
# ╠═408a59f5-c0e9-4bd2-9fe4-3c1a54bb7cd9
# ╠═47a245c6-c39a-4e17-9484-aa13d9d2d998
# ╠═809d848b-8ee3-4a8c-abdd-7e1d863e0260
# ╠═73989cbd-10c0-4b7e-94fc-59315ead56fd
# ╠═8924cea3-e558-4ecc-8181-148f70a216a3
# ╠═7bd7abab-b16d-4017-80e9-cd0e9c714a07
# ╠═cc7cbf20-9ab5-41e1-967a-f426183246a5
# ╠═72eaafb9-4130-43fa-b2c5-536509aa5bd5
# ╠═c5568d49-9a87-4224-bdf5-4365d77a44e4
# ╠═422dd2fc-9103-4fab-8e0a-e5026c7c221e
# ╠═fb14b35e-894f-4212-85e0-cbc15b029699
# ╠═c772d04b-c584-45b0-8935-b8c643fa19b3
# ╠═3f510cf6-1412-493a-944a-ce6a97e10c58
# ╠═93ea5c80-8dc9-42f7-860a-09a797ae4047
# ╠═448bb57c-95c9-4bbc-8e06-5b177802b5eb
# ╠═43d8ae9e-2673-4e58-8f9a-879da43d1239
# ╠═0539004a-3552-4f7d-b13a-8161a247c00a
# ╠═24be1cc2-e132-477f-92dc-5defe2d3de4b
# ╠═c671e317-3d47-4f33-a7a8-3e0389d3b883
# ╠═f80aa11f-6246-4d36-92e3-8673b07e3d11
# ╠═80402620-7794-44f3-b31d-5d33e64995e1
# ╠═51a6042d-3999-423a-ac54-71ed9d856474
# ╠═e21e99b0-507c-461d-8219-71c703f9f163
# ╠═dadc0dbe-ce9c-4285-b26c-fb64a80923d2
# ╠═f7beec98-52e5-4d0b-9785-b5fc2db99470
# ╠═78fd769b-a6b2-46b6-94ea-3370a5bc326c
# ╠═2079c244-bf83-4c61-9842-cbb7c2bb159d
# ╠═1d6c6e65-86ef-4db6-8f5b-058289b275a1
# ╠═5a4d3d4f-83f2-41c9-a19f-9c1ff1cb7b60
# ╠═1f4d07cc-38cf-4104-8085-e7ee9ef9d5e9
# ╠═95260162-89e5-47e8-9583-1562a2b77aac
# ╠═7dcc6788-30f6-42ce-9671-858568bca59b
# ╠═7b6c4d93-8cc7-4821-bd3e-dc3369c46086
# ╠═b748c58b-1484-4060-9b49-502b298152fb
# ╠═6aa79928-1a44-4baa-bd42-f229c4687076
# ╠═9c3b32a2-2cef-4af8-8906-c80afab33a40
# ╠═28e29d50-66ac-46ba-bb2b-1039b4fa2d4d
# ╠═0d49845b-dc0d-4a80-9bd2-496cc6abc92d
# ╠═09e409ab-d985-49ee-9005-88e0546ab767
# ╠═7b5d928f-b21b-45d8-9afe-623f8b863998
# ╠═cbe904d1-6bae-4d5d-94a6-8ba7458c6c49
# ╠═b2c048cb-43a7-4e17-9766-d664967e8195
# ╠═7e666183-bd75-4ddb-b51c-fad757f6fd8c
# ╠═53c8d369-91cd-4bca-97b0-89583aedf21b
# ╠═c119e9a3-4710-4751-8fac-6bf49725ee13
# ╠═384f7801-28c0-45cd-bd09-5d13cb1f1cbd
# ╠═39f96d90-5d40-4a20-b033-3303d856538b
# ╠═49c44c27-bc74-42ca-ac14-a916c9b71723
# ╠═48983b39-90f0-488d-94a1-990e04ba3322
# ╠═cab0f2ae-447d-4623-a804-110206275849
# ╠═792eb8bf-b2bf-44a6-bbbd-b4f9353bf0b8
# ╠═1c2b0dcf-912a-4738-8023-20569ab30b4f
# ╠═98b07f4a-3bfe-49d5-a2f1-cdf97078b795
# ╠═8b23904c-2c16-4d54-b746-1b180c38217a
# ╠═96e71174-fdb3-417f-8a3e-d841e2f6ffcf
# ╠═a931a810-7882-4718-97dc-70d11217d8e6
# ╠═328e958b-2acb-41cf-beda-85e6c04807fb
# ╠═eb1e8ba7-ca57-4780-85a5-277ffd33f7b4
# ╠═a85da6f5-ee7c-4f44-9db0-7c406f1bcf80
# ╠═30bf2b50-0703-42d7-a591-050530b655fd
# ╠═f4535587-3ac3-4d6d-a3d3-b867d946e583
# ╠═94338483-74a1-478a-badc-84431f8dfe45
# ╠═358fbc00-485f-4f21-ab7c-a2f431fef8b5
# ╠═bc94035a-795b-4d08-aab2-87519b4ffd65
# ╠═25a404ef-b21a-4d43-b87b-f4348d9bb219
# ╠═6b387a90-454d-4507-8406-4acebdff8a3d
# ╠═a0a9a625-5ac0-470b-8e00-f724064bcf97
# ╠═4f5bb727-6475-483e-8d60-9cbeed9d7822
# ╠═402ebee0-68b0-4318-809d-fa81d40ff243
# ╠═7aef4abc-0abd-4e51-8494-2805aac60869
# ╠═cdcd1a12-3beb-4080-b76c-1976a48c6500
# ╠═34abd3a8-0a33-4d02-827e-d61c74ee9838
# ╠═66d5ad2e-7569-4d40-9e1b-f49f7f2b1955
# ╠═098eafb0-8c7e-4584-b252-512d0bbb0227
# ╠═52c10638-14d0-4812-b54d-5879198be7dc
# ╠═cad420df-583c-4cfe-94db-d01506374f9e
# ╠═8b592c01-c988-4fb7-940e-a6628d35bceb
# ╠═7a9e7928-6d4e-40e8-b9ea-26e2eb6d3f61
# ╠═a7cf85d5-2299-4a6d-b2a0-9f70f1a5a96f
# ╠═01a1c439-7022-4857-968a-5321df4a183e
# ╠═c245716e-1a72-42e9-b8cc-fd65b785e968
# ╠═39a41ede-0750-471d-89b3-b2a2d4e2ce52
# ╠═7868c045-4fd9-419d-bc66-a9d14ea41c97
# ╠═c955997d-eeb5-48c6-9ab5-c85de7bef6fc
# ╠═c01f4006-98d1-48b8-a069-22f66b856c62
# ╠═657a80f5-b889-4c2f-84d3-eebdd9f28f02
# ╠═3c70b4ac-087e-41cf-a38a-fd654edb6011
# ╠═189e90ac-1516-4b4d-86c0-911bfbd1db24
# ╠═329b6035-dcd0-4238-b428-a8448141bdfa
# ╠═0c7bf844-59c0-4893-9c5f-40774bb61309
# ╠═c513d589-af7d-40d0-b496-0d0de4df56c3
# ╠═4990d1a0-30f7-4643-bd6e-39d0a642baa0
# ╠═e4e15f0f-212a-4071-b408-46dadc0b3e8d
# ╠═70054c25-f239-47e3-b5c8-30ecec5101ce
# ╠═5a019a2f-0a04-4c7e-855e-40c216de0fda
# ╠═21c0603f-43e6-49ac-827e-6188b4bc52dc
# ╠═77837a1d-16f7-4034-8c0e-6be4fc7f5b10
# ╠═f5b12fba-0525-4f19-9b69-f62fc7603e08
# ╠═96802ee7-349f-4b2a-b7e5-0697b2537142
# ╠═265a4519-24c1-49c3-af86-659e451473e9
# ╠═6a9fcae9-9fa8-4209-a735-90a092514067
# ╠═4ae96703-9ea2-4edc-bd54-1cc86a55eabc
# ╠═fa8f864a-862c-4b4c-b755-0a7e7530ccfa
# ╠═f70b6a6f-0704-4297-9913-f8328745d9ac
# ╠═d8d0ceda-a5c3-4c4a-819a-f2c513afe50a
# ╠═e5eb8771-9fa4-4bca-bdfb-abb8b1af39d3
# ╠═27b3ff56-2e40-4ba8-a366-9957bf711f88
# ╠═1fa6ce25-d853-4110-b5f1-615773e0a12d
# ╠═4f03a603-145d-415e-97de-9f400c6480b5
# ╠═79464896-4b6c-4aec-8680-b0d00c0fadc9
# ╠═2eff919e-2f67-4b5d-8e51-1ca4ef2e52f8
# ╠═5347321b-0526-4cd9-b6c7-b2366407e9f8
# ╠═3463b880-9a25-43fb-95f6-bd1aac9653f4
# ╠═ad08de30-bc54-45c1-9456-86b46eeb4602
# ╠═c483a43e-7422-477e-91ce-1431f07b0a97
# ╠═806c4f8f-c9fb-4920-9956-eb0e7ccf543f
# ╠═7e2502b8-4535-4242-b56d-2373cb0d4050
# ╠═d6a7a8f8-9bf3-4d09-a108-eddb57e2c8b2
# ╠═050af10c-ba4f-422a-8aa3-8af49ca9048b
# ╠═ccc2b2e7-dbc1-4fbb-9620-951d0ff21a42
# ╠═f1affb0e-c709-4d29-ab47-dbc017bc54c6
# ╠═cb3c760e-16cf-4817-b8fc-bdab9f1b5e8b
# ╠═392afdf7-68df-4227-87a0-22e88dfb3e75
# ╠═dbcb6057-086d-4584-b961-7b6569781ffa
# ╠═e4e970b8-0bc0-4d84-a20c-171546784439
# ╠═a47c9bca-a192-4148-8968-b105243ff04b
# ╠═d1011108-e962-4421-bc98-28483f5f560d
# ╠═4ad8f55a-b04c-4c98-9a91-ae7c380e5899
# ╠═b7dd2983-7735-4c23-a54d-ac3aabdd0838
# ╠═892566de-1f1a-4745-8713-f0244131bc6a
# ╠═361ef513-3661-4c9a-8630-4d1e42071efe
# ╠═9363fe6a-de52-493f-8aef-a336d992077c
# ╠═6723daf1-0924-43c9-97df-a230d36029be
# ╠═cee8a83c-1fc3-43fd-928f-c69ee25afba9
# ╠═41b9fa87-6a60-4896-b09e-0fe16947c5da
# ╠═8f3a92ba-577b-406e-8200-be64dddd0bc8
# ╠═2fc75d57-30e8-4c28-860c-386649436615
# ╠═95ce5454-a3a3-430a-9bc5-74fe3b5dd48f
# ╠═6796d442-ea72-4297-bad1-2b18e90d0d9a
# ╠═3c03eee2-47c3-432a-8e21-783422e18c89
# ╠═f5549c83-545a-4da2-841a-aaf1a2c656f3
# ╠═fff54865-2dd3-4997-b3eb-6381fcb15450
# ╠═d8612c9b-aa37-4eb2-a853-493d5c68dd34
# ╠═77ba073b-e243-4f8e-827b-08f95e6981d1
# ╠═a02207c9-5108-4435-8b7a-9b68ef5bb97c
# ╠═d9ed75c6-0216-4552-8a5e-b917757cc48a
# ╠═1465ebe6-965b-45ab-8f14-2f5e341c3928
# ╠═4152dd29-da41-4f77-8991-459690a85b5b
# ╠═f84125f9-5eed-48d1-aace-18100c57f2af
# ╠═19f0e235-8302-4659-bc1f-565574449a62
# ╠═3cf6bb82-151b-4082-9ff9-67506b74af59
# ╠═37aee362-f7f6-4fd7-b240-e2c6da0252cd
# ╠═07f2c7a2-4262-4f6d-bed1-171124dbd28f
# ╠═efd520b0-5890-4de4-adbc-e15664b94688
# ╠═7b21ac8e-b41c-47d0-9a69-1ddfeed7da42
# ╠═a323ff01-48f8-4e80-ac10-6b3e5a6204bc
# ╠═78c5b679-3707-427c-b8c2-103e8b58491c
# ╠═acdc6195-bddb-482d-8669-d574afa653e8
# ╠═e90df9cb-54eb-456a-ac4e-a374d2eb3ba1
# ╠═47442c7b-9c18-4e8b-96fd-0b4f472c8624
# ╠═6fdf0cc0-82ae-4dea-83f4-6da843962f4a
# ╠═bf7c9958-7100-4b32-8a45-100fe07b85b2
# ╠═12ab5565-b56a-4fd1-8a96-cb195093570f
# ╠═2e44fbb1-3b01-442b-9165-33a27f89f7e8
# ╠═2830ac94-b7a3-48fe-9865-aa3bd1293ecc
# ╠═42442364-0013-487e-b80d-47ab051f0c1b
# ╠═35678f86-dff3-4baf-ac61-22eb2aff248d
# ╠═cb5b2fe7-63aa-4fe3-a32a-e2caf6078668
# ╠═8bee3b15-811d-4c3e-9266-a023c5211eae
# ╠═7cc28408-ca76-4054-bee3-47c6553b4dd2
# ╠═ba22b383-ee9e-4ff7-a9ce-ebac8b64fdc5
# ╠═16a868cd-84b1-419e-b43f-589daaac3dc7
# ╠═baf9f998-d3ba-4b7f-a618-baf7d01ba8eb
# ╠═206882f8-0bd4-434d-a821-7775d5a60e98
# ╠═2edcb5a2-39fb-4363-a303-52ed32870291
# ╠═28ce123b-8a31-42c1-9e17-836b3a60513e
# ╠═4db895f3-712c-4ff7-b679-caf70572cae9
# ╠═af2589e3-c191-4f93-9150-295914c85c33
# ╠═491ff53c-59b5-49dd-bf12-69d3e1e1e674
# ╠═bfa4eb7f-6aef-4723-9565-dcb2131223c9
# ╠═30f2ae99-cb6d-4ac8-9ef3-154ca18ded3f
# ╠═58a811eb-97bc-4173-a3b0-6ffdf148d798
# ╠═c636919c-76d1-4b89-a59b-a3c6c0f5a495
# ╠═5392ee59-5a03-4789-a64e-2c661f250107
# ╠═7ec0aa0d-153e-4cef-a2d3-40af83928e95
# ╠═e93c8fab-b86f-4f75-961e-da53c6f1ab6a
# ╠═70d5f5eb-2544-41a9-9faf-8fe5bd6d20c2
# ╠═cda7feb9-f18b-4490-9f3d-3b726981e4df
# ╠═1faa48df-32e8-42f3-be0d-554257b948bb
# ╠═c135fa18-56ff-4e10-b59c-d34371da20c7
# ╠═eec76302-4b16-451d-9a0a-ab504f33dfe3
# ╠═b3dbf318-6e52-46ac-ae6e-2ea8832ba9e1
# ╠═3ee268a0-f32b-4c99-8da8-fc5dbff7db08
# ╠═2dea6272-e8de-4c4c-9bb5-136c42d0554d
# ╠═1a9b63d3-953e-42f2-9557-93fb9c234b02
# ╠═f2012a77-742e-49ed-b9df-d3c70519e8e0
# ╠═56cd4d6f-733d-464a-a02d-8455a977cf53
# ╠═371d8b82-0bcf-4071-81cc-a855e6944078
# ╠═83f142a0-104b-4978-acf0-9438d9913ffb
# ╠═55c08ffe-6ccb-4567-b127-20978b7676a8
# ╠═135adc8e-4169-4800-943a-fe51828fad16
# ╠═fc45db58-1856-45ef-a633-9096fd3940b9
# ╠═0c8b1e06-3f4d-42e0-a9e8-f69979ffa7dd
# ╠═5a4a22ad-cf6e-4f1e-8ca4-aedb41f5076f
# ╠═c91592c2-6bf2-4fbc-bbd4-c4703e32f1e6
# ╠═36cc5182-061d-45e9-8bca-f704e1be324d
# ╠═391cbe17-ce70-48aa-8de9-3a0aa0b6d9fb
# ╠═9472bd3a-6805-41bf-9778-eca308a39696
# ╠═95aa5f25-c707-4031-8ab0-e1d4264b07f7
# ╟─a124bf84-7ca4-40c8-8607-b05dec24a730
# ╠═75672e0c-5c34-44c8-b1a9-f6ba821d6c8d
# ╟─5f191192-bc5f-41e8-845c-beba89ee5841
# ╟─cddc45e1-7547-4d34-bc12-b08a5320a62c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
