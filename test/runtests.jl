using PlutoQuestions
using Test
using Markdown

@testset "Admonition" begin
       @test typeof(PlutoQuestions.fyi("test")) <: Markdown.MD
       @test typeof(PlutoQuestions.correct()) <: Markdown.MD
       @test typeof(PlutoQuestions.keep_working()) <: Markdown.MD
       @test typeof(PlutoQuestions.not_defined("test")) <: Markdown.MD
       @test typeof(PlutoQuestions.hint("test")) <: Markdown.MD
       @test typeof(PlutoQuestions.still_missing()) <: Markdown.MD
end

q = Question{NoDiff}(;description=Markdown.MD("correct"), validators= @safe[true])
qb = QuestionBlock(;title=Markdown.MD("title"),
                     description=Markdown.MD("description"), 
                     questions = [q],
                     hints=[ hint(Markdown.MD("Have you tried this?")),
                     hint(Markdown.MD("Have you tried switching it on and off again?"))]
);

@testset "Question" begin
       @test Question{NoDiff}(;description=Markdown.MD("correct"), validators= @safe[true]) |> typeof <: Question{NoDiff}
       @test Question{NoDiff}(;description=Markdown.MD("missing"), validators= @safe[missing]) |> typeof <: Question{NoDiff}
       @test Question{NoDiff}(;description=Markdown.MD("incorrect"), validators= @safe[false]) |> typeof <: Question{NoDiff}
       @test Question{NoDiff}(;description=Markdown.MD("crash"), validators= @safe[a[0]]) |> typeof <: Question{NoDiff}
       
       @test Question{Easy}(;description=Markdown.MD("correct"), validators= @safe[true]) |> typeof <: Question{Easy}
       @test Question{Easy}(;description=Markdown.MD("missing"), validators= @safe[missing]) |> typeof <: Question{Easy}
       @test Question{Easy}(;description=Markdown.MD("incorrect"), validators= @safe[false]) |> typeof <: Question{Easy}
       @test Question{Easy}(;description=Markdown.MD("crash"), validators= @safe[a[0]]) |> typeof <: Question{Easy}
       
       @test Question{Intermediate}(;description=Markdown.MD("correct"), validators= @safe[true]) |> typeof <: Question{Intermediate}
       @test Question{Intermediate}(;description=Markdown.MD("missing"), validators= @safe[missing]) |> typeof <: Question{Intermediate}
       @test Question{Intermediate}(;description=Markdown.MD("incorrect"), validators= @safe[false]) |> typeof <: Question{Intermediate}
       @test Question{Intermediate}(;description=Markdown.MD("crash"), validators= @safe[a[0]]) |> typeof <: Question{Intermediate}
       
       @test Question{Hard}(;description=Markdown.MD("correct"), validators= @safe[true]) |> typeof <: Question{Hard}
       @test Question{Hard}(;description=Markdown.MD("missing"), validators= @safe[missing]) |> typeof <: Question{Hard}
       @test Question{Hard}(;description=Markdown.MD("incorrect"), validators= @safe[false]) |> typeof <: Question{Hard}
       @test Question{Hard}(;description=Markdown.MD("crash"), validators= @safe[a[0]]) |> typeof <: Question{Hard}    

       @test q |> PlutoQuestions.check_answer |> typeof <: Markdown.MD 
       @test qb |> typeof <: QuestionBlock
       @test qb |> validate |> typeof <:QuestionBlock
       @test qb |> PlutoQuestions.tohtml |> typeof <:String
end

