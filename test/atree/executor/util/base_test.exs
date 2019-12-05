defmodule Atree.Executor.BaseTest do
  use ExUnit.Case

  test "Hello World" do
    assert 1 == 1
  end

  @pb Atree.Actions.Util.Null

  alias Atree.Executor.Util.Base

  describe "function predicates" do
    test "has_command" do
      refute @pb.has_command?()
    end

    test "has_test" do
      refute @pb.has_test?()
    end

    test "has_guide" do
      refute @pb.has_guide?()
    end

    test "has_screen" do
      refute @pb.has_screen?()
    end
  end

  describe "default values" do
    test "command" do
      assert Base.command(@pb, %{},%{}) == %{} 
    end

    test "test" do
      assert Base.command(@pb, %{},%{}) == %{}
    end

    test "guide" do
      assert Base.guide(@pb, %{},%{}) == ""
    end

    test "screen" do
      assert Base.screen(@pb, %{},%{})
    end
  end
end
