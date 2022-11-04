require "test_helper"

class DespesaTest < ActiveSupport::TestCase
  def setup
    @despesa = Despesa.new(descricao: "test", valor:100.00, data: Time.now,categoria: 'Saúde')
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

  def test_data_not_valid
    refute_match Time.now-1, @despesa.data
  end
end
