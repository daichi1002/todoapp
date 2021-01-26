class Api::TasksController < ApplicationController
  def index
    @tasks = Task.order('updated_at DESC')
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render :show, status: :created
    else
      render json: @tasks.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render :show, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.fetch(:task, {}).permit(:name, :in_done)
  end
  # taskがない場合にエラーを出さないようにする
end


# ステータスコード
# :ok(200) => リクエストは成功、レスポンスも要求に応じて返却
# :created(201) => リクエストは成功し、新規作成されたリソースのURIを返す
# :unprocessable_entity(422) => バリデーションのエラーの場合に返す

# render json: オブジェクト => JSON形式のデータで返却される