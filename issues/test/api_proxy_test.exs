defmodule ApiProxyTest do
  use ExUnit.Case

  alias Issues.ApiProxy, as: Api

  test "calculate sha256 checksum" do
    text = "createname=Demo+Meeting&meetingID=Demo+Meeting&voiceBridge=74972&attendeePW=ap&moderatorPW=mp&isBreakoutRoom=false&record=false3895c0fc987abdd47edf0352fea2a458"
    assert Api.calculate_checksum(:sha256, text) == "81a30be0b00e6e56c12056f868e5be19650b5b80b81602500ec700858e5d9cf4"
  end

  test "sha256 checksum" do
    checksum = "81a30be0b00e6e56c12056f868e5be19650b5b80b81602500ec700858e5d9cf4"
    assert :sha256 == Api.which_checksum(checksum)
  end
end