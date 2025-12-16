import Foundation

extension Date {
    /// Format date for display in posts (e.g., "2 hours ago", "Yesterday", etc.)
    func timeAgoDisplay() -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.minute, .hour, .day, .weekOfYear, .month, .year], from: self, to: now)
        
        if let year = components.year, year >= 1 {
            return year == 1 ? "1 year ago" : "\(year) years ago"
        }
        
        if let month = components.month, month >= 1 {
            return month == 1 ? "1 month ago" : "\(month) months ago"
        }
        
        if let week = components.weekOfYear, week >= 1 {
            return week == 1 ? "1 week ago" : "\(week) weeks ago"
        }
        
        if let day = components.day, day >= 1 {
            return day == 1 ? "Yesterday" : "\(day) days ago"
        }
        
        if let hour = components.hour, hour >= 1 {
            return hour == 1 ? "1 hour ago" : "\(hour) hours ago"
        }
        
        if let minute = components.minute, minute >= 1 {
            return minute == 1 ? "1 minute ago" : "\(minute) minutes ago"
        }
        
        return "Just now"
    }
    
    /// Format date as readable string (e.g., "Jan 15, 2024")
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
    
    /// Format date with time (e.g., "Jan 15, 2024 at 3:45 PM")
    func formattedDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}

struct DateUtils {
    static let shared = DateUtils()
    
    private let isoFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        return formatter
    }()
    
    /// Parse ISO8601 date string
    func parseISO8601(_ dateString: String) -> Date? {
        return isoFormatter.date(from: dateString)
    }
    
    /// Convert date to ISO8601 string
    func toISO8601(_ date: Date) -> String {
        return isoFormatter.string(from: date)
    }
}
