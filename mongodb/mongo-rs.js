rsconf = {
    _id: "repl0a",
    members: [
      {_id: 1, host: "mongo1:27017"},
      {_id: 2, host: "mongo2:27017"},
      {_id: 3, host: "mongo3:27017"} 
    ]
  }

  rs.initiate(rsconf)