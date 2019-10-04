ThinkingSphinx::Index.define :profile, :with => :real_time do
  indexes fullname
  indexes bio
end
