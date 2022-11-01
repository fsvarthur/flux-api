require "test_helper"

class DespesaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @despesa = Despesa.new(descricao: "test", valor:100.00, data: Time.now)
  end

  def test_despesa_valid?
    assert @despesa.valid?
  end

  def test_despesa_save?
    assert @despesa.save
  end

  def test_despesa_destroy?
    assert @despesa.destroy
  end

  def test_despesa_not_valid
    @despesa.descricao = ""
    assert_not @despesa.valid?
  end

  def test_valor_not_valid
    @despesa.valor = -0.1
    assert_not @despesa.valid?
  end

  def test_data_not_valid
    refuse_match Time.now-1, @despesa.data
  end
end
