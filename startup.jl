ENV["EDITOR"] = "nvim"
if isinteractive()
    using Revise
    using BenchmarkTools
    using Pkg
    if isfile("Project.toml")
        Pkg.activate(".")
    end

    function usePlots(backend::Symbol = :interactive)
        deps = Pkg.dependencies()
        if any(info -> info.name == "juliaPlottingKit", values(deps))
            println("juliaPlottingKit is already an explicit dependency of the current project. Returning without doing anything")
            return nothing
        end

        if any(info -> info.name == "Makie", values(deps))
            println("Makie is already an explicit dependency of the current project. Returning without doing anything.")
            return nothing
        end

        if !any(path -> path == "@plotting", LOAD_PATH)
            push!(LOAD_PATH, "@plotting")
            @info "Added @plotting environment to LOAD_PATH."
        end

        @eval using juliaPlottingKit
        @eval using Makie

        if backend in (:interactive, :gl)
            @eval using GLMakie
            Base.invokelatest(GLMakie.activate!)
            println("Plotting enabled with GLMakie... Use `usePlots(:cairo)` for svg")
        elseif backend in (:publication, :cairo)
            @eval using CairoMakie
            # Set CairoMakie to produce vector graphics (svg) or raster (png)
            Base.invokelatest(CairoMakie.activate!, type = "svg")
            println("Plotting enabled with CairoMakie... Use `usePlots(:gl)` for GLMakie")
        else
            @error "Unknown backend: `$backend`. Use `:interactive` or `:publication`."
            return
        end
    
        # Apply your custom theme by default
        Base.invokelatest(juliaPlottingKit.setMyPlotTheme!)
        println("Base theme from generalAesthetics set")
    end
end

# atreplinit() do repl
#     @eval using Revise
#     @eval using BenchmarkTools
#     @eval using JET
# end

# if isinteractive() # use PackageCompiler to precompile this into a system image
#     using OhMyREPL
#     using Crayons
#     import OhMyREPL: Passes.SyntaxHighlighter
#     #https://github.com/rebelot/kanagawa.nvim, but with macros linking to a special
#     kanagawaScheme = SyntaxHighlighter.ColorScheme()
#     SyntaxHighlighter.keyword!(kanagawaScheme, Crayon(foreground = 0x957FB8, background = 0x1F1F28))
#     SyntaxHighlighter.macro!(kanagawaScheme, Crayon(foreground = 0xE46876, background = 0x1F1F28))
#     SyntaxHighlighter.comment!(kanagawaScheme, Crayon(foreground = 0x727169, background = 0x1F1F28))
#     SyntaxHighlighter.call!(kanagawaScheme, Crayon(foreground = 0x7E9CD8, background = 0x1F1F28))
#     SyntaxHighlighter.string!(kanagawaScheme, Crayon(foreground = 0x98BB6C, background = 0x1F1F28))
#     SyntaxHighlighter.error!(kanagawaScheme, Crayon(foreground = 0xE82424, background = 0x1F1F28))
#     SyntaxHighlighter.number!(kanagawaScheme, Crayon(foreground = 0xD27E99, background = 0x1F1F28))
#     SyntaxHighlighter.op!(kanagawaScheme, Crayon(foreground = 0xC0A36E, background = 0x1F1F28))
#     SyntaxHighlighter.function_def!(kanagawaScheme, Crayon(foreground = 0x7E9CD8, background = 0x1F1F28))
#     SyntaxHighlighter.text!(kanagawaScheme, Crayon(foreground = 0xDCD7BA, background = 0x1F1F28))
#     SyntaxHighlighter.symbol!(kanagawaScheme,Crayon(foreground = 0xE6C384, background = 0x1F1F28))
#     SyntaxHighlighter.argdef!(kanagawaScheme, Crayon(foreground = 0x7AA89F, background = 0x1F1F28))
#     SyntaxHighlighter.add!("kanagawa",kanagawaScheme)
#     colorscheme!("kanagawa")
#     @info "Using OhMyREPL"
# end


