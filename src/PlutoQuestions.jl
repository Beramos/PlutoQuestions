#=
Created on Friday 4 December 2020
Last update: Tuesday 28 September 2021

@author: Bram De Jaegher
bram.de.jaegher@gmail.com
=#

module PlutoQuestions
  using Markdown
  using Markdown: MD, Admonition

  export still_missing, keep_working, correct, not_defined, hint, fyi  
  export Question, QuestionBlock, validate
  export NoDiff, Easy, Intermediate, Hard
  export @safe, @terminal

  include("styles.jl")
  include("admonition.jl")
  include("question.jl")
  include("macros.jl")
# Write your package code here.
end
