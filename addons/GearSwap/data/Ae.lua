function auto()
    windower.chat.input("/ma \"Banish\" <t>")
    coroutine.schedule(auto, 5)
end
 
auto()