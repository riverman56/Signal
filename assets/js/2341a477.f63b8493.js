"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[658],{49164:e=>{e.exports=JSON.parse('{"functions":[{"name":"subscribe","desc":"Registers a callback to be invoked when the signal is fired.\\n\\n\\n\\t","params":[{"name":"callback","desc":"The callback to be invoked","lua_type":"(...any) -> ()"}],"returns":[{"desc":"A function that disconnects the callback","lua_type":"() -> ()"}],"function_type":"method","source":{"line":26,"path":"src/create.luau"}},{"name":"fire","desc":"Invokes all currently subscribed callbacks. Note that, if a callback is\\nsubscribed mid-fire, it will not be invoked during that firing.\\nCallbacks are invoked using\\n[`task.spawn`](https://create.roblox.com/docs/reference/engine/libraries/task#spawn),\\nso it\'s okay to yield inside a callback.\\n\\t","params":[{"name":"...","desc":"","lua_type":"any"}],"returns":[],"function_type":"method","source":{"line":49,"path":"src/create.luau"}}],"properties":[{"name":"_isFiring","desc":"A flag indicating whether or not the signal is currently firing","lua_type":"boolean","private":true,"source":{"line":12,"path":"src/create.luau"}}],"types":[],"name":"Signal","desc":"A simple publish/subscribe architecture implementation","source":{"line":7,"path":"src/create.luau"}}')}}]);