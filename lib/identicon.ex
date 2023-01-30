defmodule Identicon do
  def main(input) do
    input
    |> hash_input()
    |> pick_color()
    |> build_grid()
  end

  def build_grid(image) do
    %Identicon.Image{hex: hex} = image

    hex
    |> Enum.chunk_every(3)
    |> Enum.map(&mirror_row/1)
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end

  def pick_color(image) do
    # this line here is acknowledging that there are more
    # elements in the list but we don't actually care about them !
    %Identicon.Image{hex: [r, g, b | _tail]} = image
    %Identicon.Image{image | color: {r, g, b}}

    # return rgb
    [r, g, b]
  end

  def hash_input(input) do
    # generates a random list of 15 elements
    hex =
      :crypto.hash(:md5, input)
      # converting into list
      |> :binary.bin_to_list()

    # using Struct to store our value with hex as property
    %Identicon.Image{hex: hex}
  end
end
