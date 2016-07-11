require('spec_helper.rb')

describe(Task) do
  before() do
    Task.clear()
  end

  describe("#==") do
    it("is the same task if it has the same description and list ID") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1})
      task2 = Task.new({:description => "learn SQL", :list_id => 1})
      expect(task1).to(eq(task2))
    end
  end

  describe("#description") do
    it("gives the task a description") do
      test_task = Task.new({:description => "vacuum your car"})
      expect(test_task.description()).to(eq("vacuum your car"))
    end
  end

  describe(".all") do
    it("an array that is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "repair my bike tire", :list_id => 1})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.list_id()).to(eq(1))
    end
  end



  describe(".clear") do
    it("empties the task array of all the saved tasks") do
    Task.new("do laundry").save()
    Task.clear()
    expect(Task.all()).to(eq([]))
    end
  end
end
