Skyscape Developer Test

# Introduction

Ideally, creating such a thing wouldn't make any really sense as there are sufficient libraries out there that can do a
better job, in this case I'd use (http://ruby-doc.org/stdlib-2.1.2/libdoc/securerandom/rdoc/SecureRandom.html)[SecureRandom].

From a security perspective, when creating a password generator we should always include alphanumeric characters.
Allowing possibly special characters to be optional. Though I'd strongly consider including that in the defaults.

This is why I've come up with the following signature.

## Usage

`PasswordGenerator.new(length: 10, options={uppercase: true,lowercase: true, number: true, special=true})`

## Issues

The main difficulty is testing that we get the expected values, as the return value is random we will not always have
both a number and special character in the returned password. Implementing functionality to allow for this would make
the generator less secure as an element of predictability to it.