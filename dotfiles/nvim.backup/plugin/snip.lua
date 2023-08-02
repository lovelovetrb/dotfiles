local luasnip = require('luasnip')
local snippet_node = luasnip.snippet_node
local snippet = luasnip.snippet
local text = luasnip.text_node
local insert = luasnip.insert_node
local absolute_indexer = require("luasnip.nodes.absolute_indexer")
local function_node = luasnip.function_node

luasnip.add_snippets(nil, {
    typescriptreact = {
        snippet({
            trig = 'component',
        }, {
            text({ 'const ' }),
            insert(1),
            snippet_node(nil, {
                insert(1),
                text({ ' = () => {', '  return ()', '}', 'export default ' }),
                function_node(function(args) return args[1] end, absolute_indexer[1])
            })
        }),
        snippet({
            trig = 'page',
        }, {
            text({'import { NextPage } from "next";', 'const Page: NextPage = () => {', '   return ();', '};', '', 'export default Page;'}),
        }),
    },
})
