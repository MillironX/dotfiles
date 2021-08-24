try
    using OhMyREPL
    enable_autocomplete_brackets(false)
catch e
    @warn "Error initalizing OhMyREPL" exception=(e, catch_backtrace())
end
try
    using Revise
catch e
    @warn "Error initalizing Revise" exception=(e, catch_backtrace())
end
