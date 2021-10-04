
# Datagaze

Look at your database without ever leaving your model. Yay!

`datagaze` dynamically inserts and updates schema information into your Rails models, which in effect prevents you from having to visit schema.rb and helps other developers to quickly grasp the nature of your model.

## Sneak preview

```ruby

# app/models/user.rb

=begin

== Schema information for table 'users'

column_name     column_type     column_default     

id              integer         -                  
first_name      string          -                  
last_name       string          -
confirmed       boolean         false
created_at      datetime        -                  
updated_at      datetime        -                  

=end

class User < ApplicationRecord

  # Just your User model contents, as it already is.

end

```

## The problem

Background: the wildly popular `annotate` gem (which is awesome, thanks guys) has a fundamental flaw, which `datagaze` fixes:

`annotate` assumes your project has one single directory for all models, by default Rails' standard `app/models` directory. This means that any model that falls out of that scope, will produce an error and prevent ALL models from being annotated. For some this may just be fine, but for the many who are mainting larger applications, gems and simply projects with different file structures, this is breaking.

## The Fix

Instead of relying on a certain given file structure, as `annotate` does, `datagaze` combines the use of ruby's core method `const_source_location` with rails' method `ApplicationRecord.descendants`. In effect, `datagaze` is able to dynamically trace the location of ANY model that inherits from ApplicationRecord, no matter where it is hidden in your project.

## `datagaze` vs. `annotate`

Whilst this approach is crucial to some, annotate is better for others. So let's make a fair comparision:

### Why `datagaze` is better

- It handles all models, irregardless of their source location (as explained above)
– The `datagaze` gem has a smaller memory footprint than `annotate`
- Customization / forking `datagaze`'s source code is much easier (sorry guys, but your `annotate` code base is a mess)


### Why `annotate` is better

- `datagaze` relies on ruby's `const_source_location` method, which was only released in ruby 2.7
- `annotate` has been around for much longer and thus has more configurable options (pull requests are welcome though)
# datagaze
