require IEx

defmodule XYComponent do
  use GenEvent

  ### Public API
  # position is a tuple whose first element is the x component and whose second element is the y component
  def get_position(entity) do
    :gen_event.call(entity, XYComponent, :get_position)
  end

  ### GenEvent API
  def init(position) do
    {:ok, position}
  end

  def handle_call({:move, {:y, new_y}}, {x, _}) do
    IO.puts "move y"
    {:ok, {x, new_y}}
  end

  def handle_call({:move, {:x, new_x}}, {_, y}) do
    {:ok, {new_x, y}}
  end

  def handle_call(:get_position, position) do
    {:ok, position, position}
  end
end
