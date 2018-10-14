defmodule Issues.ApiProxy do
  
  @hash [:sha, :sha256]

  def calculate_checksum(hash, text) when hash in @hash do
    :crypto.hash(hash, text) |> Base.encode16 |> String.downcase
  end

  def which_checksum(checksum) do
   if String.length(checksum) == 64, do: calculate_checksum(:sha256, checksum), else: calculate_checksum(:sha,  checksum)
  end

  def strip_checksum_from_query(query, checksum) do
    query
    |> String.replace("&checksum=#{checksum}", "")
    |> String.replace("checksum=#{checksum}&", "")
  end
end