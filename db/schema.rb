# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111216130501) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.integer  "number"
    t.string   "other"
    t.string   "email"
    t.string   "telefono"
    t.integer  "taddress_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "localidad_id"
  end

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "admin_users_roles", :id => false, :force => true do |t|
    t.integer  "admin_user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avaluos", :force => true do |t|
    t.integer  "tgi_id"
    t.float    "valor"
    t.float    "descuento"
    t.integer  "edificacion_id"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bromatologias", :force => true do |t|
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  create_table "catastros", :force => true do |t|
    t.integer  "numero_expediente_colegio"
    t.date     "final_de_obra"
    t.string   "partida"
    t.integer  "category_id"
    t.string   "type"
    t.integer  "convenio_id"
    t.integer  "pase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "responsable"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "civils", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comercies", :force => true do |t|
    t.integer  "person_id"
    t.float    "ingresos_brutos"
    t.integer  "cantidad_de_personal"
    t.string   "cuit"
    t.boolean  "jubilado"
    t.boolean  "muerto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "convenios", :force => true do |t|
    t.integer  "tributable_id"
    t.string   "tributable_type"
    t.integer  "tributo_id"
    t.date     "inicio"
    t.integer  "cuotas"
    t.float    "interes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convenios_deudas", :id => false, :force => true do |t|
    t.integer  "convenio_id"
    t.integer  "deuda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursos", :force => true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.date     "inicio"
    t.string   "duracion"
    t.string   "institucion"
    t.string   "titulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departamentos", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deudas", :force => true do |t|
    t.integer  "tributable_id"
    t.string   "tributable_type"
    t.integer  "periodo_id"
    t.integer  "calculable_id"
    t.string   "calculable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "motivo"
    t.integer  "baja"
  end

  create_table "edificacions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empleados", :force => true do |t|
    t.integer  "person_id"
    t.date     "inicio"
    t.string   "legajo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", :force => true do |t|
    t.integer  "person_id"
    t.integer  "father_id"
    t.integer  "mother_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frentes", :force => true do |t|
    t.integer  "categoria"
    t.float    "metros"
    t.integer  "avaluo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "localidads", :force => true do |t|
    t.string   "name"
    t.integer  "departamento_id"
    t.string   "postal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manzanas", :force => true do |t|
    t.string   "name"
    t.boolean  "luz"
    t.boolean  "agua"
    t.boolean  "gas"
    t.boolean  "cloaca"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matrimonios", :force => true do |t|
    t.date     "inicio"
    t.string   "estado"
    t.integer  "person1_id"
    t.integer  "person2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "negocios", :force => true do |t|
    t.string   "name"
    t.integer  "rubro_id"
    t.integer  "bromatologia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categoria"
  end

  add_index "negocios", ["bromatologia_id"], :name => "index_negocios_on_bromatologia_id"
  add_index "negocios", ["rubro_id"], :name => "index_negocios_on_rubro_id"

  create_table "oficinas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pases", :force => true do |t|
    t.integer  "oficina_id"
    t.integer  "catastro_id"
    t.date     "entrada"
    t.text     "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos", :id => false, :force => true do |t|
    t.integer  "catastro_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.date     "born"
    t.string   "doc"
    t.date     "dead"
    t.text     "observations"
    t.integer  "civil_id"
    t.integer  "tdoc_id"
    t.integer  "city_id"
    t.integer  "sexo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pather_id"
    t.integer  "mother_id"
    t.date     "locked"
  end

  create_table "periodos", :force => true do |t|
    t.date     "vencimiento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "name"
  end

  create_table "profesionals", :force => true do |t|
    t.string   "titulo"
    t.integer  "matricula"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responsables", :id => false, :force => true do |t|
    t.integer  "tributo_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rubros", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sexos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taddresses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tdocs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tgis", :force => true do |t|
    t.integer  "tributo_id"
    t.integer  "manzana_id"
    t.string   "seccion_inmueble"
    t.float    "superficie"
    t.string   "seccion"
    t.string   "lote"
    t.string   "folio"
    t.string   "tomo"
    t.string   "inscripcion_dominio"
    t.date     "fecha"
    t.string   "parcela"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tgivariables", :force => true do |t|
    t.integer  "tgi_id"
    t.float    "avaluo"
    t.integer  "edificacion_id"
    t.float    "descuento"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titulares", :id => false, :force => true do |t|
    t.integer  "tributo_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body",       :null => false
  end

  create_table "tributos", :force => true do |t|
    t.string   "calle"
    t.integer  "numero"
    t.string   "otro"
    t.string   "pii"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tributable_id",   :null => false
    t.string   "tributable_type", :null => false
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
