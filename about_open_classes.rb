require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutOpenClasses < Neo::Koan
  class Dog
    def bark
      "WOOF"
    end
  end

  def test_as_defined_dogs_do_bark
    fido = Dog.new
    assert_equal "WOOF", fido.bark
  end

  # ------------------------------------------------------------------

  # Open the existing Dog class and add a new method.
  class Dog
    def wag
      "HAPPY"
    end
  end

  def test_after_reopening_dogs_can_both_wag_and_bark
    fido = Dog.new
    assert_equal "HAPPY", fido.wag
    assert_equal "WOOF", fido.bark
  end

  # ------------------------------------------------------------------

  class ::Integer
    def answer_to_life_universe_and_everything?
      self == 42
    end
  end

  def test_even_existing_built_in_classes_can_be_reopened
    assert_equal false, 1.answer_to_life_universe_and_everything?
    assert_equal true, 42.answer_to_life_universe_and_everything?
  end

  # NOTE: To understand why we need the :: before Integer, you need to
  # become enlightened about scope.
  #
  # NOTE(jdan): Well, I need to reopen the ROOT Integer class, not
  # the one defined in AboutOpenClasses
end
