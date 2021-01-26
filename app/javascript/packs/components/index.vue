<template>
  <div>
    <!-- 新規作成部分 -->
    <div class="row">
      <div class="col s10 m11">
        <input class="form-control" placeholder="Add your task!!">
      </div>
      <div class="col s2 m1">
        <div class="btn-floating waves-effect waves-light red">
          <i class="material-icons">add</i>
        </div>
      </div>
    </div>
    <!-- リスト表示部分 -->
    <div>
      <ul class="collection">
        <li id="row_task_1" class="collection-item">
          <input type="checkbox" id="task_1" />
          <span for="task_1">Sample Task</span>
        </li>
        <li id="row_task_2" class="collection-item">
          <input type="checkbox" id="task_2" />
          <span for="task_2">Sample Task</span>
        </li>
        <li id="row_task_3" class="collection-item">
          <input type="checkbox" id="task_3" />
          <span for="task_3">Sample Task</span>
        </li>
      </ul>
    </div>
    <!-- 完了済みタスク表示ボタン -->
    <div class="btn">Display finished tasks</div>
    <!-- 完了済みタスク一覧 -->
    <div id="finished-tasks" class="display_none">
      <ul class="collection">
        <li id="row_task_4" class="collection-item">
          <input type="checkbox" id="'task_4" checked="checked" />
          <span v-bind:for="task_4" class="line-through">Done Task</span>
        </li>
        <li id="row_task_5" class="collection-item">
          <input type="checkbox" id="'task_5" checked="checked" />
          <span v-bind:for="task_5" class="line-through">Done Task</span>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function() {
      return {
        tasks: [],
        newTask: ''
      }
    },
    mounted: function() {
      this.fetchTasks();
    },
    methods: {
      fetchTasks: function() {
        axios.get('/api/tasks').then((response) => {
          for(var i = 0; i< response.data.tasks.length; i++) {
            this.tasks.push(response.data.tasks[i]);
          }
        }, (error) => {
          console.log(error);
        });
      },
    }
  }
</script>