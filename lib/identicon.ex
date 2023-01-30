defmodule Identicon do
  def main(input) do
    input
    |> hash_input()
    |> pick_color()
  end

  def pick_color(image) do
    # this line here is acknowledging that there are more
    # elements in the list but we don't actually care about them !
    %Identicon.Image{hex: [r, g, b | _tail]} = image

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
