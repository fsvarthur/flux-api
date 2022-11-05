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

  def test_valor_not_valid
    @despesa.valor = 0
    assert_not @despesa.valid?
  end

  def test_filter_by_descricao
    Despesa.new(descricao: "test", valor:100.00, data: Time.now,categoria: 'Saúde').save
    assert_equal Despesa.filter_by_descricao("test").count, 1
  end

  def test_filter_by_half_descricao
    Despesa.new(descricao: "test", valor:100.00, data: Time.now,categoria: 'Saúde').save
    assert_equal Despesa.filter_by_descricao("te").count, 1
  end
end
