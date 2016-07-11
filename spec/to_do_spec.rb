require('spec_helper.rb')

describe(Task) do

  describe("#==") do
    it("is the same task if it has the same description and list ID") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2016-08-01"})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2016-08-01"})
      expect(task1).to(eq(task2))
    end
  end

  describe("#description") do
    it("gives the task a description") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2016-08-01"})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe(".all") do
    it("an array that is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2016-08-01"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2016-08-01"})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe(".due_date") do
    it("it lets you sort tasks by due date") do
      test_task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2016-08-01"})
      test_task2  = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2016-09-01"})
      test_task1.save()
      test_task2.save()
      expect(Task.due_date()).to(eq([test_task1, test_task2]))
    end
  end

end
