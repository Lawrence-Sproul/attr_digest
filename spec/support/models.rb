class ModelWithUsername < ActiveRecord::Base
  attr_digest :password, protected: false, validations: false, confirmation: false, case_sensitive: false

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end

class ModelWithFormatOption < ActiveRecord::Base
  self.table_name = "model_with_usernames"

  attr_digest :password, validations: false, confirmation: false, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end

class ModelWithMinimumLengthOption < ActiveRecord::Base
  self.table_name = "model_with_usernames"

  attr_digest :password, validations: false, confirmation: false, length: { minimum: 5 }

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end

class ModelWithMaximumLengthOption < ActiveRecord::Base
  self.table_name = "model_with_usernames"

  attr_digest :password, validations: false, confirmation: false, length: { maximum: 10 }

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end

class ModelWithLengthRangeOption < ActiveRecord::Base
  self.table_name = "model_with_usernames"

  attr_digest :password, validations: false, confirmation: false, length: { in: 5..10 }

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end

class ModelWithExactLengthOption < ActiveRecord::Base
  self.table_name = "model_with_usernames"

  attr_digest :password, validations: false, confirmation: false, length: { is: 8 }

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end

class ModelWithTimeAndMemoryCostOptions < ActiveRecord::Base
  self.table_name = "model_with_usernames"

  attr_digest :password, protected: false, validations: false, confirmation: false, case_sensitive: false, time_cost: 3, memory_cost: 12

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end

class ModelWithInvalidMemoryCostOption < ActiveRecord::Base
  self.table_name = "model_with_usernames"

  attr_digest :password, protected: false, validations: false, confirmation: false, case_sensitive: false, memory_cost: 32

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end

class ModelWithInvalidTimeCostOption < ActiveRecord::Base
  self.table_name = "model_with_usernames"

  attr_digest :password, protected: false, validations: false, confirmation: false, case_sensitive: false, time_cost: 0

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end

class ModelWithAttrDigestSecretOption < ActiveRecord::Base
  self.table_name = "model_with_usernames"

  attr_digest :password, secret: 'super_secret'

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end

class ModelWithAttrDigest < ActiveRecord::Base
  attr_digest :password
  attr_digest :security_answer

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :security_question, presence: true
end

class ModelWithAttrDigestAndCaseSensitiveOption < ActiveRecord::Base
  self.table_name = "model_with_attr_digests"

  attr_digest :password
  attr_digest :security_answer, case_sensitive: false

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :security_question, presence: true
end

class ModelWithAttrDigestAndProtectedOption < ActiveRecord::Base
  self.table_name = "model_with_attr_digests"

  attr_digest :password
  attr_digest :security_answer, protected: true

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :security_question, presence: true
end

class ModelWithAttrDigestAndValidationsOption < ActiveRecord::Base
  self.table_name = "model_with_attr_digests"

  attr_digest :password
  attr_digest :security_answer, validations: false

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :security_question, presence: true
end

class ModelWithAttrDigestAndConfirmationOption < ActiveRecord::Base
  self.table_name = "model_with_attr_digests"

  attr_digest :password
  attr_digest :security_answer, confirmation: false

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :security_question, presence: true
end
