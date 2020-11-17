class Attendance < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '出席' },
    { id: 3, name: '欠席' }
  ]
end
