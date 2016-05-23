Skyscape Developer Test

# Introduction

Ideally, creating such a thing wouldn't make any realy sense as there are sufficient libraries out there that can do a
better job, in this case I'd use (http://ruby-doc.org/stdlib-2.1.2/libdoc/securerandom/rdoc/SecureRandom.html)[SecureRandom].

From a security perspective, when creating a password generator we should always include alphanumberic characters.
Allowing possibly special characters to be optional. Though I'd strongly consider including that in the defaults.

This is why I've come up with the following signation.

## Usage

`PasswordGenerator.new(length: 10, options={uppercase: true,lowercase: true, number: true, special=true})`