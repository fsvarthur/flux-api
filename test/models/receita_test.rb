require "test_helper"

class ReceitaTest < ActiveSupport::TestCase
  def setup
    @receita = Receita.new(descricao: "Teste", valor: 100.00, data: Time.now)
  end

  test "deve ser valido" do
    assert @receita.valid?
  end

  def test_receita_save?
    assert @receita.save
  end

  def test_receita_destroy?
    assert @receita.destroy
  end

  def test_receita_not_valid
    @receita.descricao = ""
    assert_not @receita.valid?
  end
end
