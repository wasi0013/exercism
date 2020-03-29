defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna('') do
    ''
  end

  def to_rna('A' ++ dna) do
    'U' ++ to_rna(dna)
  end

  def to_rna('C' ++ dna) do
    'G' ++ to_rna(dna)
  end

  def to_rna('T' ++ dna) do
    'A' ++ to_rna(dna)
  end

  def to_rna('G' ++ dna) do
    'C' ++ to_rna(dna)
  end
end
