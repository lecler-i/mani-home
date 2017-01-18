[![Build Status](https://travis-ci.com/lecler-i/mani-home.svg?token=g6epgtUqZ1QoxxxJ3knd&branch=master)](https://travis-ci.com/lecler-i/mani-home)
[![codecov](https://codecov.io/gh/lecler-i/mani-home/branch/master/graph/badge.svg?token=SuVsTcWWWf)](https://codecov.io/gh/lecler-i/mani-home)

Mani-Home
=============

Launch it (need npm and elixir): 

```elixir
mix deps.get
iex -S mix
```

Tests:

```elixir
mix deps.get
mix test
```

Then :  
- go to http://localhost:4000 to see athe app. 
- you can test hot loading by changing a react template in `web/components/xx`,
  or the css in `web/css/index.css`.
- you can see the webpack UI in http://localhost:4000/webpack
- you can test the javascript exception converted into elixir in http://localhost:4000/with_stacktrace
