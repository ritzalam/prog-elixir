defmodule Issues.ApiProxy do
  
  def calculate_checksum(:sha256, text) do
    :crypto.hash(:sha256, text) |> Base.encode16 |> String.downcase
  end

  def calculate_checksum(:sha1, text) do
    :crypto.hash(:sha, text) |> Base.encode16 |> String.downcase
  end

  def which_checksum(checksum) do
   if String.length(checksum) == 64, do: :sha256, else: :sha
  end
end