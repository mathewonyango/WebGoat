// This query searches for methods that receive user input and directly pass it to a database call.
from Method m
where m.name starts with "set" or m.name starts with "update"
  and m.parameters.size() > 0 // Method has at least one parameter
  and exists (p in m.parameters | // Find a parameter that receives user input
     exists (call c in p.usages |
       c.callee.name == "getParameter" && // User input retrieval function (replace with actual function)
       c.arguments.size() == 1)) // Parameter receives single argument (user input)
