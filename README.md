
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

## The problem of the annotate gem

Background: the wildly popular `annotate` gem (which is awesome, thanks guys) has a fundamental flaw, which `datagaze` fixes:

Annotate requires that your project has one single directory for all models (by default the `app/models` directory). Any models that are not placed in this directory, will produce an error and prevent ALL models from being annotated. 

For some this may just be fine – but for the many who are maintaining larger applications, gems or simply projects that require flexibility, this is breaking.

## The fix by datagaze

Instead of relying on a rigid file structure, datagaze combines ruby's dynamic `const_source_location` with rails' dynamic `ApplicationRecord.descendants`. 

In effect, datagaze is able to dynamically trace the location of ANY model that inherits from ApplicationRecord, no matter where it is hidden in your project.

## datagaze vs. annotate

Whilst this approach is crucial to some, annotate is better for others. So let's make a fair comparision:

### Why datagaze is better

- Datagaze handles all models irregardless of their source location, thereby putting no constraints on your project.
- Datagaze has a substantially smaller memory footprint than annotate.
- Datagaze is simpler to use: due to configuration being absent, you just have install the gem and run the instructions once.
- Datagaze's source code is much easier to customize or fork (sorry folks, annotate's code base is a mess).

### Why annotate is better

- Datagaze relies on ruby's `const_source_location` method, which was only released in ruby 2.7. If you operate below, you can't use datagaze.
- Annotate has more configurable options (pull requests are welcome though).



