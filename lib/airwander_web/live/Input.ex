defmodule AirwanderWeb.InputLive do
  use Phoenix.LiveView

  @dropdown_options ["Type of Trip", "One-Way", "Round-Trip", "Multi-City", "World-Tour"]

  def render(assigns) do
    ~L"""
    <div class="container">
    <h1>Air Wander 0.01</h1>
    <form phx-change="input_changed">
    
      <select name="trip_type" id="trip_type">
        <%= for t <- @trip_options do %>
        <option value="<%= t %>"
          <%= if @selected_trip==t do %>
             selected
            <% end %>
         >
          <%= t %>
        </option>
        <% end %>
      </select>
    
    
    <div style="display: flex;justify-content: space-evenly;">
    
      <input type="text" name="input1" value="<%= @input1 %>" >
      <input type="text" name="input2" value="<%= @input2 %>" >
    
      <%= if @selected_trip=="Round-Trip" do %>
       <input type="text" name="input3" value="<%= @input3 %>" >
      <% end %>
    
      <%= if @selected_trip=="Multi-City" do %>
       <input type="text" name="input3" value="<%= @input3 %>" >
      <% end %>
    
      <%= if @selected_trip=="World-Tour" do %>
       <input type="text" name="input3" value="<%= @input3 %>" >
        <input type="text" name="input4" value="<%= @input4 %>" >
      <% end %>
    
    </div>
    </form>
    
    
    
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       trip_options: @dropdown_options,
       selected_trip: nil,
       input1: nil,
       input2: nil,
       input3: nil,
       input4: nil
     )}
  end

  def handle_event("input_changed", %{"trip_type" => ""}, socket) do
    {:noreply,
     assign(socket,
       selected_trip: nil,
       input1: nil,
       input2: nil,
       input3: nil,
       input4: nil
     )}
  end

  def handle_event("input_changed", %{"trip_type" => "One-Way"}, socket) do
    {:noreply,
     assign(socket,
       selected_trip: "One-Way",
       input1: "Input #1",
       input2: "Input #2",
       input3: nil,
       input4: nil
     )}
  end

  def handle_event("input_changed", %{"trip_type" => "Round-Trip", "input1" => value}, socket) do
    {:noreply,
     assign(socket,
       selected_trip: "Round-Trip",
       input1: value,
       input2: "Input #2",
       input3: value,
       input4: nil
     )}
  end

  def handle_event("input_changed", %{"trip_type" => "Multi-City"}, socket) do
    {:noreply,
     assign(socket,
       selected_trip: "Multi-City",
       input1: "Input #1",
       input2: "Input #2",
       input3: "Input #3",
       input4: nil
     )}
  end

  def handle_event("input_changed", %{"trip_type" => "World-Tour"}, socket) do
    {:noreply,
     assign(socket,
       selected_trip: "World-Tour",
       input1: "Input #1",
       input2: "Input #2",
       input3: "Input #3",
       input4: "Input #4"
     )}
  end
end
