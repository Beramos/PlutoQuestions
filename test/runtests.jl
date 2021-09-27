using PlutoQuestions
using Test
using Markdown


@testset "Admonition.jl" begin
       @test typeof(PlutoQuestions.fyi("test")) <: Markdown.MD
       @test typeof(PlutoQuestions.correct()) <: Markdown.MD
       @test typeof(PlutoQuestions.keep_working()) <: Markdown.MD
       @test typeof(PlutoQuestions.not_defined("test")) <: Markdown.MD
       @test typeof(PlutoQuestions.hint("test")) <: Markdown.MD
       @test typeof(PlutoQuestions.still_missing()) <: Markdown.MD
end
